# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ii_callback/version'

Gem::Specification.new do |spec|
  spec.name          = "ii_callback"
  spec.version       = IICallback::VERSION
  spec.authors       = ["Yoshikazu Kaneta"]
  spec.email         = ["kaneta@sitebridge.co.jp"]
  spec.summary       = %q{A callback class for activerecord}
  spec.description   = %q{A callback class for activerecord}
  spec.homepage      = "https://github.com/kanety/ii_callback"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 5.0"
  spec.add_dependency "activerecord", ">= 5.0"
  spec.add_dependency "coactive", ">= 0.2"

  spec.add_development_dependency "rails", ">= 5.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "simplecov"
end
