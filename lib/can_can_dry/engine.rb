# frozen_string_literal: true

require 'cancancan'
require 'eac_rails_utils/engine'

module CanCanDry
  class Engine < ::Rails::Engine
    include ::EacRailsUtils::EngineHelper
  end
end
