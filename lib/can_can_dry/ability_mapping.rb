module CanCanDry
  module AbilityMapping
    RESOURCES_ACTION_MAPPING = {
      read: %w(index show),
      create: %w(new create),
      update: %w(update edit),
      destroy: %w(destroy)
    }
    ALL_ACTION = 'ALL'

    attr_reader :mapping

    def map_controller(controller, *can_actions)
      map_action(controller, ALL_ACTION, *can_actions)
    end

    # 1. Encontra o controller associado a resource.
    # 2. Mapeia:
    # * map_action(controller, 'index', :read, resource)
    # * map_action(controller, 'show', :read, resource)
    # * map_action(controller, 'new', :create, resource)
    # * map_action(controller, 'create', :create, resource)
    # * map_action(controller, 'update', :update, resource)
    # * map_action(controller, 'edit', :update, resource)
    # * map_action(controller, 'destroy', :destroy, resource)
    def map_resources(resource)
      RESOURCES_ACTION_MAPPING.each do |can_action, actions|
        actions.each do |action|
          map_action(controller_by_resource(resource), action, can_action, resource)
        end
      end
    end

    def map_action(controller, action, *can_args)
      if can_args.count == 1
        fail "\"can_args\" deve ter 0 ou 2 ou mais elementos (can_args.count=#{can_args.count})"
      end
      @mapping ||= {}
      @mapping[controller] ||= {}
      @mapping[controller][action] ||= []
      @mapping[controller][action] << can_args
    end

    def can_args_by_path(path, method)
      can_args_by_path_hash(Rails.application.routes.recognize_path(path, method: method))
    rescue ActionMappingNotFound => ex
      raise PathMappingNotFound.new(path, method, ex)
    end

    def can_args_by_path_hash(path_hash)
      can_args_args = find_can_args_list(path_hash[:controller], path_hash[:action])
      replace_model_by_record(can_args_args, path_hash[:id])
    end

    private

    def replace_model_by_record(can_args_args, id)
      can_args_args.map do |can_args|
        ca = can_args.dup
        ca[1] = ca[1].find_by_id(id) if id && ca[1]
        ca
      end
    end

    def controller_by_resource(resource)
      resource = resource.name if resource.is_a?(Class)
      ActiveSupport::Inflector.pluralize(resource)
    end

    def find_can_args_list(controller, action)
      controller = ActiveSupport::Inflector.camelize(controller)
      fail ActionMappingNotFound.new(controller, action) unless @mapping[controller]
      return @mapping[controller][action] if @mapping[controller][action]
      return @mapping[controller][ALL_ACTION] if @mapping[controller][ALL_ACTION]
      fail ActionMappingNotFound.new(controller, action)
    end
  end
end
