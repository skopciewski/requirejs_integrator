# coding: utf-8

begin
  require './lib/requirejs_integrator/version'
rescue LoadError
  module RequirejsIntegrator; VERSION = '0'; end
end

Gem::Specification.new do |spec|
  spec.name          = 'requirejs_integrator'
  spec.version       = RequirejsIntegrator::VERSION
  spec.authors       = ['Szymon Kopciewski']
  spec.email         = 's.kopciewski@gmail.com'
  spec.summary       = ''
  spec.description   = ''
  spec.homepage      = 'https://github.com/skopciewski/requirejs_integrator'
  spec.license       = 'GPL-3.0'

  spec.files         = Dir.glob('{bin,lib,data}/**/*') + \
                       %w(Gemfile LICENSE README.md CHANGELOG.md)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'exec_executor', '~> 1.0'
  spec.add_runtime_dependency 'system_executor', '~> 1.0'
  spec.add_runtime_dependency 'stdout_outputter', '~> 1.0'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-given'
  spec.add_development_dependency 'pry'

end
