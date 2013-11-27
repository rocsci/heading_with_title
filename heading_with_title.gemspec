# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'heading_with_title/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "heading_with_title"
  s.version     = HeadingWithTitle::VERSION
  s.authors     = ["Andrew Kozloff"]
  s.email       = ["demerest@gmail.com"]
  s.homepage    = "https://github.com/rocsci/heading_with_title"
  s.summary     = 'A set of helpers for Rails'
  s.description = 'Setting the page heading at the same time with a page title'
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
