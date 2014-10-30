module RoomoramaApi
  class Config
    URL = "https://api.staging.roomorama.com"
    API_VERSION = "v1.0"
    attr_reader :base_url, :api_version
    attr_accessor :client_id, :client_secret, :token

    def initialize( client_id = nil, client_secret = nil, token = nil )
      @client_id = client_id
      @client_secret = client_secret
      @token = token
      @api_version = API_VERSION
      @base_url = URL
    end

  end
end
