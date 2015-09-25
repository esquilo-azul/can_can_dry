$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'can_can_dry/version'

Gem::Specification.new do |s|
  s.name        = 'can_can_dry'
  s.version     = CanCanDry::VERSION
  s.authors     = ['Agora Vai!']
  s.summary     = 'Autorização DRY com CanCanCan.'

  s.files = Dir['{app,config,db,lib}/**/*']
  s.test_files = Dir['test/**/*']
end
