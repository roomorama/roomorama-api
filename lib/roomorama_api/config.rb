module RoomoramaApi
  class Config
    URL = "https://api.roomorama.com"
    API_VERSION = "v1.0"
    attr_reader :api_version
    attr_accessor :client_id, :client_secret, :token, :base_url

    def initialize( client_id = nil, client_secret = nil, token = nil, base_url = nil )
      @client_id = client_id
      @client_secret = client_secret
      @token = token
      @api_version = API_VERSION
      @base_url = base_url || URL
    end

  end
end
