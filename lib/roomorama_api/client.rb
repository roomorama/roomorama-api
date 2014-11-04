module RoomoramaApi

  class Client
    include ::ActiveModel::AttributeMethods

    END_POINTS = {
      host_properties: 'host/rooms',
      host_property: 'host/rooms/%{id}'
    }

    attribute_method_suffix :_url
    define_attribute_methods [:host_properties, :host_property]

    attr_reader :access_token, :token
    attr_accessor :config

    def initialize( config = nil )
      @config = config || RoomoramaApi::Config.new
    end

    # configuration method returns set of credentials depends on env.
    #
    # @returns RoomoramaApi::Config
    #
    # @example:
    #   RoomoramaApi::Config
    class << self

      def configuration
        if block_given?
          config = RoomoramaApi::Config.new
          yield(config)
          client = self.new( config )
        end
      end

      alias_method :setup, :configuration
    end


    # method which is authenticating against Roomorama API using OAuth2
    #
    # @returns OAuth::AccessToken
    #
    # @example:
    #   auth_token.post("/v1.0/me.json")
    #   auth_token.post(create_room_url)
    #
    def auth_token
      @access_token ||= get_access_token
    end

    def get_properties
      auth_get(host_properties_url)
    end

    def get_property(property_hash)
      property_url = host_property_url(property_hash)
      auth_get(property_url)
    end

    def create_property(property_hash)
      auth_post(host_properties_url, property_hash)
    end

    def update_property(property_hash)
      property_url = host_property_url(property_hash)
      auth_put(property_url, property_hash)
    end

    # method which builds endpoint's url
    # method can be used for builing Matrix of resource x action  x Version of API
    #
    # @returns "https://api.staging.roomorama.com/v1.0/host/rooms"
    #
    # @example:
    #   roomorama_client.create_property_url
    #
    def attribute_url(attribute, hash = nil)
      end_point = END_POINTS[attribute.to_sym]
      raise EndpointNotImplemented unless end_point
      url = "#{@config.base_url}/#{@config.api_version}/#{end_point}.json"
      hash ? (url % hash) : url
    end

    def get_access_token
      client = ::OAuth2::Client.new("", "", site: @config.base_url, raise_errors: false)
      OAuth2::AccessToken.new(client, @config.token)
    end

    [:get, :post, :put, :delete].each do |http_method|
      define_method("auth_#{http_method}") { |url, attrs = {}| auth_request(http_method, url, attrs) }
      define_method(http_method) { |url| raise EndpointNotImplemented }
    end

    def auth_request(method, url, attrs)
      raw_response = auth_token.send method, url, params: attrs
      prepare_response(raw_response)
    end

    def prepare_response(response)
      case response.status
      when 200..206 then parse_response(response)
      when 401 then raise UnauthorizedRequest
      when 422
        error_response = parse_response(response)
        error_response = (error_response && error_response.has_key?(:errors)) ? error_response[:errors] : 'Received empty response from API'
        raise InvalidRequest, error_response
      when 500..505 then raise ApiNotResponding
      else
        raise UnexpectedResponse
      end
    end

    def parse_response(response)
      if response.respond_to?(:response) && response.response.respond_to?(:body)
        JSON.parse(response.response.body)['result']
      end
    end

  end

end

