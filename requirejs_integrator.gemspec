# frozen_string_literal: true

begin
  require "./lib/requirejs_integrator/version"
rescue LoadError
  module RequirejsIntegrator; VERSION = "0"; end
end

Gem::Specification.new do |spec|
  spec.name          = "requirejs_integrator"
  spec.version       = RequirejsIntegrator::VERSION
  spec.authors       = ["Szymon Kopciewski"]
  spec.email         = ["s.kopciewski@gmail.com"]
  spec.summary       = "The tasks for assets managment with requirejs"
  spec.description   = "The tasks for assets managment with requirejs"
  spec.homepage      = "https://github.com/skopciewski/requirejs_integrator"
  spec.license       = "GPL-3.0"

  spec.require_paths = ["lib"]
  spec.files         = Dir.glob("{bin,lib,data}/**/*") + \
                       %w(Gemfile LICENSE README.md CHANGELOG.md)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_runtime_dependency "piko_model", "~>1"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "codeclimate-test-reporter"
end
