module RoomoramaApi

  class Client
    include ::ActiveModel::AttributeMethods

    attribute_method_suffix :_url
    define_attribute_methods [:create_room, :update_room, :delete_room]
   
    attr_reader :access_token

    def initialize( client_id = nil, client_secret = nil )
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
    # @returns authentication_token 
    #
    # @example:
    # 
    def establish_connection
      @access_token ||= get_access_token
    end


    def create_room
      url = create_room_url
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
      "https://#{@base_url}/#{api_version}/#{end_point}" 
    end

    private

    def get_access_token
      url = ""
      headers = {} 
      body = ""
      RestClient.post( url, headers, body )
    end 

  end 

end
