require 'active_model'

require 'roomorama_api/config'
require 'roomorama_api/client'


module RoomoramaApi

  class Error < RuntimeError ; end
  class EndpointNotImplemented < Error ; end


end
