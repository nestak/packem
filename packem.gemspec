Gem::Specification.new do |s|
  s.name        = 'nestak-packem'
  s.version     = '0.0.1.pre'
  s.date        = '2010-07-30'
  s.summary     = 'Newsletter Build Tool'
  s.description = 'Validate, make textfile and zipfile with one command from command line.'
  s.authors     = ['Anastazy Kubiak']
  s.email       = 'anastazy.kubiak@gmail.com'
  s.homepage    = 'https://github.com/nestak/packem'
  s.license     = 'MIT'

  s.files       = ['lib/packem.rb','bin/packem']
  s.executables << 'packem'

  s.add_runtime_dependency 'premailer', ['= 1.8.2']
  s.add_runtime_dependency 'w3c_validators', ['= 1.2']
end