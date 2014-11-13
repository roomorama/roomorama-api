Gem::Specification.new do |s|
  s.name  = 'roomorama_api'
  s.version = '0.0.4'
  s.date    = '2014-11-02'
  s.summary = "Roomorama Api Client - Ruby wrapper library to consume Roomorama's API 1.0"
  s.description = "Roomorama Api Client - Ruby wrapper library to consume Roomorama's API 1.0"
  s.authors  = ['Adam Goryczka', 'Paul Ballesty']
  s.email    = [ 'adam@roomorama.com',  'paul@roomorama.com']
  s.files    =   Dir.glob("{lib,spec,doc}/**/*") + %w(Gemfile README.md)
  s.license  = 'MIT'

  s.add_dependency "rest_client"
  s.add_dependency "oauth2"
  s.add_dependency "activemodel"
end
