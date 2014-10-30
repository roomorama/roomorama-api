module RoomoramaApi
  class Config
    URL = "api.staging.roomorama.com"
    attr_reader :base_url
    attr_accessor :client_id, :client_secret, :token

    def initialize( client_id = nil, client_secret = nil, token = nil )
      @client_id = client_id
      @client_secret = client_secret
      @token = token
      @base_url = URL
    end

  end
end
