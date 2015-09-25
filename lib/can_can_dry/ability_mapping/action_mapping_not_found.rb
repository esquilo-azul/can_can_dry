module CanCanDry
  module AbilityMapping
    class ActionMappingNotFound < Exception
      def initialize(controller, action)
        super('Nenhum mapeamento de controle de acesso encontrado ' \
            "para a action \"#{controller}##{action}\"")
      end
    end
  end
end
