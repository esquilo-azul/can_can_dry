# frozen_string_literal: true

module CanCanDry
  module AbilityMappingSets
    module Devise
      def map_devise
        map_resources 'Devise::Session'
        map_resources 'Devise::Password'
      end
    end
  end
end
