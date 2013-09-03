# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activeadmin-therole/version'

Gem::Specification.new do |spec|
  spec.name          = "activeadmin-therole"
  spec.version       = ActiveadminTheRole::VERSION
  spec.authors       = ["daanforever"]
  spec.email         = ["daan.forever@gmail.com"]
  spec.description   = "ActiveAdmin and TheRole integration"
  spec.summary       = "Provides ActiveAdmin and TheRole integration"
  spec.homepage      = "https://github.com/daanforever/activeadmin-therole"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.0.0"
  spec.add_dependency "the_role", ">= 2.1.0"
  spec.add_dependency "activeadmin", ">= 0.6.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1.0"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
