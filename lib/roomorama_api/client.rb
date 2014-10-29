module RoomoramaApi

  class Client
    include ::ActiveModel::AttributeMethods

    @@end_points = {
      create_property: 'host/rooms'
    }

    @@api_version = 'v1.0'

    attribute_method_suffix :_url

    define_attribute_methods [:create_property, :update_property]

    attr_reader :access_token, :token
    attr_accessor :config

    def initialize( config = nil )
      @config = config
      @token  = config.token rescue nil
      @base_url = RoomoramaApi::Config.new.base_url
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

    def create_property(property_hash)
      auth_post(create_property_url, property_hash)
    end

    # method which builds endpoint's url
    # method can be used for builing Matrix of resource x action  x Version of API
    #
    # @returns "https://api.staging.roomorama.com/v1.0/host/rooms"
    #
    # @example:
    #   roomorama_client.create_property_url
    #
    def attribute_url(attribute)
      end_point = @@end_points[attribute.to_sym]
      raise EndpointNotImplemented unless end_point
      "#{@base_url}/#{@@api_version}/#{end_point}.json"
    end



    def get_access_token
      client = ::OAuth2::Client.new("", "", site: @base_url, raise_errors: false)
      OAuth2::AccessToken.new(client, @token)
    end

    [:get, :post, :put, :delete].each do |http_method|
      define_method("auth_#{http_method}") { |url, attrs = nil| auth_request(http_method, url, attrs) }
      define_method(http_method) { |url| raise EndpointNotImplemented }
    end

    def auth_request(method, url, attrs)
      raw_response = auth_token.send method, url
      prepare_response(raw_response)
    end

    def prepare_response(response)
      case response.status
      when 200..206 then parse_response(response)
      when 401 then raise UnauthorizedRequest
      when 422 then raise InvalidRequest, parse_response(response)['errors']
      when 500..505 then raise ApiNotResponding
      else
        raise UnexpectedResponse
      end
    end

    def parse_response(response)
      JSON.parse(response.response.body)['response']
    end

  end

end
