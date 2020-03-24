# frozen_string_literal: true

module CanCanDry
  module AbilityMappingSets
    module Devise
      def map_devise
        map_resources 'Devise::Confirmation'
        map_resources 'Devise::OmniauthCallback'
        map_resources 'Devise::Registration'
        map_resources 'Devise::Session'
        map_resources 'Devise::Password'
        map_resources 'Devise::Unlock'
      end
    end
  end
end
