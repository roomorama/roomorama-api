Gem::Specification.new do |s|
  s.name  = 'roomorama_api'
  s.version = '0.0.4'
  s.date    = '2014-11-02'
  s.summary = 'Roomorama Api client - wrapper which allows to make authenticated calls to the Roomorama API'
  s.description = 'Roomorama Api client - wrapper which allows to make authenticated calls to the Roomorama API'
  s.authors  = ['Adam Goryczka', 'Paul Ballesty']
  s.email    = [ 'adam.goryczka@gmail.com',  'paul@roomorama.com']
  s.files    =   Dir.glob("{lib,spec,doc}/**/*") + %w(Gemfile README.md)
  s.license  = 'MIT'

  s.add_dependency "rest_client"
  s.add_dependency "oauth2"
  s.add_dependency "activemodel"
end
