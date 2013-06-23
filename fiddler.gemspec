# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fiddler/version'

Gem::Specification.new do |spec|
  spec.name          = "fiddler"
  spec.version       = Fiddler::VERSION
  spec.authors       = ["Davide D'Agostino"]
  spec.email         = ["info@daddye.it"]
  spec.description   = %q{A nano helper for ruby fiddle}
  spec.summary       = spec.description
  spec.homepage      = "http://github.com/DAddYE/fiddler"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
