# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'can_can_dry/version'

Gem::Specification.new do |s|
  s.name        = 'can_can_dry'
  s.version     = CanCanDry::VERSION
  s.authors     = ['Esquilo Azul Company']
  s.summary     = 'DRY authorization with CanCanCan.'
  s.homepage    = 'https://github.com/esquilo-azul/can_can_dry'
  s.metadata    = { 'source_code_uri' => 'https://github.com/esquilo-azul/can_can_dry' }

  s.add_dependency 'rails', '>= 4.2.1'
  s.add_dependency 'cancancan', '>= 1.13.0'

  s.add_development_dependency 'rake', '>= 12.1.0'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile']
  s.test_files = Dir['test/**/*']
end
