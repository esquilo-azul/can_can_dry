# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'can_can_dry/version'

Gem::Specification.new do |s|
  s.name        = 'can_can_dry'
  s.version     = CanCanDry::VERSION
  s.authors     = ['Esquilo Azul Company']
  s.summary     = 'DRY authorization with CanCanCan.'
  s.homepage    = 'https://github.com/esquilo-azul/can_can_dry'
  s.metadata    = { 'source_code_uri' => 'https://github.com/esquilo-azul/can_can_dry' }

  s.add_dependency 'cancancan', '~> 3.5'
  s.add_dependency 'eac_rails_utils', '~> 0.23', '>= 0.23.2'
  s.add_dependency 'eac_ruby_utils', '~> 0.121'

  s.add_development_dependency 'eac_rails_gem_support', '~> 0.9', '>= 0.9.2'

  s.files = Dir['{app,config,db,lib}/**/*']
  s.required_ruby_version = '>= 2.7'
end
