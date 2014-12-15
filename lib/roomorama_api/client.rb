module RoomoramaApi

  class Client
    include ::ActiveModel::AttributeMethods

    END_POINTS = YAML::load(File.open(File.join(__dir__, 'routes.yml')))

    attribute_method_suffix :_url
    define_attribute_methods END_POINTS.keys

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

    include RoomoramaApi::Host::Properties
    include RoomoramaApi::Host::Availabilities
    include RoomoramaApi::Host::Images

    # method which builds endpoint's url
    # method can be used for builing Matrix of resource x action  x Version of API
    #
    # @returns "https://api.staging.roomorama.com/v1.0/host/rooms"
    #
    # @example:
    #   roomorama_client.create_property_url
    #
    def attribute_url(attribute, hash = nil)
      end_point = END_POINTS[attribute]
      raise EndpointNotImplemented unless end_point
      url = "#{@config.base_url}/#{@config.api_version}/#{end_point}.json"
      hash ? (url % hash) : url
    end

    private

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

    def get_access_token
      opts = {
        site: @config.base_url,
        raise_errors: false
      }
      client = ::OAuth2::Client.new("", "", opts)
      OAuth2::AccessToken.new(client, @config.token)
    end

    [:get, :post, :put, :delete].each do |http_method|
      define_method("auth_#{http_method}") { |url, attrs = {}| auth_request(http_method, url, attrs) }
      define_method(http_method) { |url| raise EndpointNotImplemented }
    end

    def auth_request(method, url, attrs)
      if method == :get
        raw_response = auth_token.send(method, url, params: attrs)
      else
        opts = { headers: {'Content-Type' => 'application/json'} }
        raw_response = auth_token.send(method, url, opts) { |req| req.body = attrs.to_json }
      end
      prepare_response(raw_response)
    end

    def prepare_response(response)
      case response.status
      when 200..206 then parse_successful_response(response)
      when 401 then raise UnauthorizedRequest
      when 404 then raise NotFound
      when 422
        error_response = parse_invalid_response(response)
        error_response = error_response.presence || 'Received empty response from API'
        raise InvalidRequest, error_response
      when 500..505 then raise ApiNotResponding
      else
        raise UnexpectedResponse
      end
    end

    def parse_successful_response(response)
      json_response = parse_response(response)
      return json_response['response'] if json_response && json_response.is_a?(Hash) && json_response.has_key?('response')
      return json_response['result'] if json_response && json_response.is_a?(Hash) && json_response.has_key?('result')
      json_response
    end

    def parse_invalid_response(response)
      json_response = parse_response(response)
      return json_response['response']['errors'] if json_response && json_response['response'] && json_response['response']['errors']
      return json_response['errors'] if json_response && json_response['errors']
    end

    def parse_response(response)
      body = response.response.body.strip
      return JSON.parse(response.response.body) unless body.empty?
      true
    end

  end

end

