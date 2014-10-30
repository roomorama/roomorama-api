module RoomoramaApi

  class Client
    include ::ActiveModel::AttributeMethods

    attribute_method_suffix :_url
    define_attribute_methods [:create_room, :update_room, :delete_room]
   
    attr_reader :access_token

    def initialize( token = nil )
      @token = token
      @base_url = RoomoramaApi::Config.new.base_url
    end
    

    # configuration method returns set of credentials depends on env.
    #  
    # @returns RoomoramaApi::Config
    # 
    # @example:
    #   RoomoramaApi::Config
    def configuration
      RoomoramaApi::Config.new
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


    def create_room
      @access_token.post( create_room_url )
    end


    # method which builds endpoint's url
    # method can be used for builing Matrix of resource x action  x Version of API
    # 
    # @returns "https://api.staging.roomorama.com/v1.0/host/rooms"
    # 
    # @example: 
    #   roomorama_client.create_room_url
    #
    def attribute_url(attribute)
      raise EndpointNotImplemented unless attribute == "create_room"
      api_version = "v1.0"
      end_point = "host/rooms"
      "https://#{@base_url}/#{api_version}/#{end_point}.json" 
    end

    private

    def get_access_token
      client = ::OAuth2::Client.new( "", "", site: @base_url )
      OAuth2::AccessToken.new( client, @token )
    end 

  end 

end
