module CanCanDry
  require 'rails'

  class Railtie < Rails::Railtie
    rake_tasks { load 'tasks/can_can_dry.rake' }
  end
end
