# frozen_string_literal: true
module CanCanDry
  module AbilityMappingSets
    module ActiveScaffold
      ACTIVE_SCAFFOLD_MAPPING = {
        read: [:browse, :index, :mark, :render_field, :show, :show_search],
        create: [:create, :new],
        update: [:add_existing, :edit, :edit_associated, :new_existing, :update, :update_column],
        destroy: [:destroy, :destroy_existing]
      }.freeze

      def map_active_scaffold(controller, entity)
        ACTIVE_SCAFFOLD_MAPPING.each do |can_action, actions|
          actions.each { |action| map_action controller, action.to_s, can_action, entity }
        end
      end
    end
  end
end
