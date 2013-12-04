# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hopper/version'

Gem::Specification.new do |spec|
  spec.name          = "hopper"
  spec.version       = Hopper::VERSION
  spec.authors       = ["Doug Everly"]
  spec.email         = ["Doug@Everly.org"]
  spec.description   = %q{Hopper accumulates items and executes a block of code when its capacity is reached, or the timeout is reached, whichever event occurs first.}
  spec.summary       = %q{Hopper is useful for collecting a certain number of items before processing them, whilst not blocking too long if the capacity is not reached.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
