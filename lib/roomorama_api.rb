require 'active_model'

require_relative 'roomorama_api/config'
require_relative 'roomorama_api/client'


module RoomoramaApi

  class Error < RuntimeError ; end
  class EndpointNotImplemented < Error ; end


end
