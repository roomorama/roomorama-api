require 'active_model'
require 'oauth2'
require 'json'

require_relative 'roomorama_api/host/properties'
require_relative 'roomorama_api/host/availabilities'
require_relative 'roomorama_api/host/images'

require_relative 'roomorama_api/config'
require_relative 'roomorama_api/client'


module RoomoramaApi

  class Error < RuntimeError ; end

  class EndpointNotImplemented < Error ; end

  class UnauthorizedRequest < Error ; end
  class ApiNotResponding < Error ; end
  class InvalidRequest < Error ; end
  class UnexpectedResponse < Error ; end

end
