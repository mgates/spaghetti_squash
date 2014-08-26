# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spaghetti_squash/version'

Gem::Specification.new do |spec|
  spec.name          = "spaghetti_squash"
  spec.version       = SpaghettiSquash::VERSION
  spec.authors       = ["Micah Gates"]
  spec.email         = ["gems@mgates.com"]
  spec.summary       = %q{Squash Your Callback Spaghetti}
  spec.homepage      = "https://github.com/mgates/spaghetti_squash"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
