module CanCanDry
  module Helpers
    module CanCanDryHelper
      def ability_mapping
        @ability_mapping ||= ::AbilityMapping.new
      end

      def can_by_path?(path, method = :get)
        can_by_can_args(ability_mapping.can_args_by_path(main_app.root_path, path, method))
      end

      def can_by_path_hash?(path_hash)
        can_by_can_args(ability_mapping.can_args_by_path_hash(path_hash))
      end

      def link_or_text(name = nil, options = nil, html_options = nil)
        link_or_default(name, name, options, html_options)
      end

      def link_or_nil(name = nil, options = nil, html_options = nil)
        link_or_default(name, nil, options, html_options)
      end

      private

      def link_or_default(name, default, options, html_options)
        if can_by_link_options?(options, html_options)
          link_to(name, options, html_options)
        else
          default
        end
      end

      def can_by_link_options?(options, html_options)
        can_by_path?(url_for(options), link_method(options, html_options))
      end

      def link_method(*hashs)
        hashs.each do |h|
          return h[:method] if h.is_a?(Hash) && h[:method]
        end
        :get
      end

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
