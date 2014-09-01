# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rezip/version'

Gem::Specification.new do |spec|
  spec.name          = "rezip"
  spec.version       = Rezip::VERSION
  spec.authors       = ["Brian O'Keefe"]
  spec.email         = ["brian@bokstuff.com"]
  spec.summary       = %q{Undo unzip operations with ease.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/brianokeefe/rezip"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "rubyzip", "~> 1.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "aruba", "~> 0.6"
end
