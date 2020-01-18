# frozen_string_literal: true
module CanCanDry
  # A substitute for CanCan::ControllerAdditions when no controller is present.
  module NoControllerCanCanAdditions
    extend ::ActiveSupport::Concern

    included do
      include ::CanCan::ControllerAdditions
    end

    class << self
      attr_reader :current_user

      def with_current_user(user)
        old_user = @current_user
        begin
          @current_user = user
          yield
        ensure
          @current_user = old_user
        end
      end
    end

    def current_user
      ::CanCanDry::NoControllerCanCanAdditions.current_user
    end
  end
end
