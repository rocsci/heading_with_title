# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "heading_with_title/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "heading_with_title"
  s.version       = HeadingWithTitle::VERSION
  s.authors       = ["Andrew Kozloff"]
  s.email         = ["demerest@gmail.com"]
  s.homepage      = "https://github.com/rocsci/heading_with_title"
  s.summary       = "A set of helpers for Rails"
  s.description   = "Setting the page heading at the same time with a page title"
  s.license       = "MIT"
  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "rails"
  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
end
