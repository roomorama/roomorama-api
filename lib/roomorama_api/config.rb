module RoomoramaApi
  class Config
    URL = "api.staging.roomorama.com"
    attr_reader :base_url

    def initialize( client_id = nil, client_secret = nil )
      @client_id = client_id
      @client_secret = client_secret
      @base_url = URL
    end

  end
end
