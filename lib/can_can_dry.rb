module CanCanDry
  require 'can_can_dry/railtie'
  require_dependency 'can_can_dry/controller_authorization'
  require_dependency 'can_can_dry/ability_mapping_sets/devise'
  require_dependency 'can_can_dry/ability_mapping_sets/devise_invitable'
  require_dependency 'can_can_dry/ability_mapping'
  require_dependency 'can_can_dry/ability_mapping/path_mapping_not_found'
  require_dependency 'can_can_dry/ability_mapping/action_mapping_not_found'
  require_dependency 'can_can_dry/helpers/can_can_dry_helper'
  require_dependency 'can_can_dry/path_recognizer'

  ActionView::Base.send :include, CanCanDry::Helpers::CanCanDryHelper
end
