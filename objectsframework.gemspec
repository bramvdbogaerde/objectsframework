Gem::Specification.new do |s|
  s.name        = 'objectsframework'
  s.version     = '1.1.1'
  s.licenses    = ['MIT']
  s.summary     = "HTTP routes based on objects"
  s.description = "Very simple http application framework, no special extras, just the basics. More documentation is coming!"
  s.authors     = ["Bram Vandenbogaerde"]
  s.email       = 'contact@bramvdb.com'
  s.files       = Dir.glob("lib/**/**")
  s.add_runtime_dependency "rack","~> 1.6.0"
  s.add_runtime_dependency "thin","~> 1.6.3"
  s.homepage    = 'https://github.com/bramvdbogaerde/objectsframework'
end
