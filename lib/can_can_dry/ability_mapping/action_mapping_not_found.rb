# frozen_string_literal: true

module CanCanDry
  module AbilityMapping
    class ActionMappingNotFound < RuntimeError
      def initialize(controller, action)
        super('Nenhum mapeamento de controle de acesso encontrado ' \
              "para a action \"#{controller}##{action}\"")
      end
    end
  end
end
