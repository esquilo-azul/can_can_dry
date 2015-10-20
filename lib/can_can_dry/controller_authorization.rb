require_dependency 'can_can_dry/helpers/can_can_dry_helper'

module CanCanDry
  module ControllerAuthorization
    include CanCanDry::Helpers::CanCanDryHelper

    def authorize_by_ability_mapping
      fail CanCan::AccessDenied, "Falhou ao tentar acessar #{path_hash}" unless
        can_by_path_hash?(path_hash)
    end

    private

    def path_hash
      params.select { |k, _v| %w(controller action id).include?(k) }
    end

    def ability_mapping
      @ability_mapping ||= ::AbilityMapping.new
    end
  end
end
