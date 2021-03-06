# frozen_string_literal: true

module CanCanDry
  module AbilityMappingSets
    module DeviseInvitable
      def map_devise_invitable
        map_resources 'Devise::Invitations'
        map_resources 'DeviseInvitable::Registration'
      end
    end
  end
end
