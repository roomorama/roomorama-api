require 'active_model'
require 'oauth2'
require 'json'

require_relative 'roomorama_api/host/properties'
require_relative 'roomorama_api/host/availabilities'
require_relative 'roomorama_api/host/images'

require_relative 'roomorama_api/config'
require_relative 'roomorama_api/client'


module RoomoramaApi

  class NetworkError < StandardError
    def initialize(status, body)
      super("Error. HTTP status: #{status}. Response body: #{body}")
    end
  end

  class UnauthorizedRequest < NetworkError; end
  class NotFound < NetworkError; end
  class ApiNotResponding < NetworkError; end
  class InvalidRequest < NetworkError; end
  class UnexpectedResponse < NetworkError; end

  class EndpointNotImplemented < StandardError
    def initialize(endpoint)
      super("Unrecognized endpoint: #{endpoint}")
    end
  end

end
