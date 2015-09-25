module CanCanDry
  module AbilityMapping
    class PathMappingNotFound < Exception
      def initialize(path, method, ex)
        super("Falha ao tentar recuperar mapeamento \"#{path}\", método=#{method}: #{ex}")
      end
    end
  end
end
