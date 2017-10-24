module CanCanDry
  # Copiado de https://github.com/appirits/awesome_admin_layout
  # /lib/awesome_admin_layout/recognize_path.rb
  module PathRecognizer
    class << self
      def recognize(root_path, path, options = {})
        path = remove_root_path(root_path, path)
        return Rails.application.routes.recognize_path(path, options)
      rescue ActionController::RoutingError
        Rails::Engine.subclasses.each do |engine|
          recognized_path = engine_recognize(engine, path, options)
          return recognized_path if recognized_path
        end
        raise "Path not recognized: \"#{path}\" (Options: #{options})"
      end

      private

      def remove_root_path(root_path, path)
        path = path.gsub(/\A#{Regexp.quote(root_path)}/, '')
        path.gsub(%r{\A/*}, '/')
      end

      def engine_recognize(engine, path, options)
        engine_path = path_for_engine(engine.instance.class, path)
        return unless engine_path
        begin
          return engine.instance.routes.recognize_path(engine_path, options)
        rescue ActionController::RoutingError => e
          Rails.logger.debug "[#{engine}] ActionController::RoutingError: #{e.message}"
        end
        nil
      end

      def path_for_engine(engine_class, path)
        engine_route = Rails.application.routes.routes.find { |r| app_class_for(r) == engine_class }
        return unless engine_route
        path.gsub(/^#{engine_route.path.spec}/, '')
      end

      def app_class_for(route)
        if Rails.version =~ /\A4\.2\./
          # for Rails 4.2
          route.app.app
        else
          # for Rails 4.1, 4.0, 3.2
          route.app
        end
      end
    end
  end
end
