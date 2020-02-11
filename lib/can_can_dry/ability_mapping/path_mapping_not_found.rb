# frozen_string_literal: true

module CanCanDry
  module AbilityMapping
    class PathMappingNotFound < RuntimeError
      def initialize(path, method, error)
        super("Falha ao tentar recuperar mapeamento \"#{path}\", método=#{method}: #{error}")
      end
    end
  end
end
