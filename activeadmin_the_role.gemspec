# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activeadmin_the_role/version'

Gem::Specification.new do |spec|
  spec.name          = "activeadmin_the_role"
  spec.version       = ActiveadminTheRole::VERSION
  spec.authors       = ["daanforever"]
  spec.email         = ["daan.forever@gmail.com"]
  spec.description   = "ActiveAdmin and The_Role integration"
  spec.summary       = "ActiveAdmin and The_Role integration"
  spec.homepage      = "https://github.com/daanforever/activeadmin_the_role"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
