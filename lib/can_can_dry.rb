# frozen_string_literal: true

require 'active_support/dependencies'
require 'cancancan'

module CanCanDry
  require 'can_can_dry/railtie'
  require_dependency 'can_can_dry/controller_authorization'
  require_dependency 'can_can_dry/ability_mapping_sets/active_scaffold'
  require_dependency 'can_can_dry/ability_mapping_sets/devise'
  require_dependency 'can_can_dry/ability_mapping_sets/devise_invitable'
  require_dependency 'can_can_dry/ability_mapping'
  require_dependency 'can_can_dry/ability_mapping/path_mapping_not_found'
  require_dependency 'can_can_dry/ability_mapping/action_mapping_not_found'
  require_dependency 'can_can_dry/engine'
  require_dependency 'can_can_dry/no_controller_can_can_additions'
  require_dependency 'can_can_dry/path_recognizer'
end
