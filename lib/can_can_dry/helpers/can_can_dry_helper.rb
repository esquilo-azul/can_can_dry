module CanCanDry
  module Helpers
    module CanCanDryHelper
      def ability_mapping
        @ability_mapping ||= AbilityMapping.new
      end

      def can_by_path?(path, method = :get)
        can_by_can_args(ability_mapping.can_args_by_path(path, method))
      end

      def can_by_path_hash?(path_hash)
        can_by_can_args(ability_mapping.can_args_by_path_hash(path_hash))
      end

      private

      def can_by_can_args(can_args_args)
        can_args_args.each do |c|
          next if c.empty?
          return false unless can?(*c)
        end
        true
      end
    end
  end
end
