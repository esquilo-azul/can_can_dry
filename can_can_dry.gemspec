# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'can_can_dry/version'

Gem::Specification.new do |s|
  s.name        = 'can_can_dry'
  s.version     = CanCanDry::VERSION
  s.authors     = ['Esquilo Azul Company']
  s.summary     = 'DRY authorization with CanCanCan.'

  s.add_dependency 'activesupport', '>= 4.2.1'
  s.add_dependency 'cancancan', '>= 1.13.0'

  s.files = Dir['{app,config,db,lib}/**/*']
  s.test_files = Dir['test/**/*']
end
