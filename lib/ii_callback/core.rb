# frozen_string_literal: true

module IICallback
  module Core
    extend ActiveSupport::Concern
    include Coactive::Initializer

    included do
      self.context_class = IICallback::Context
      context :record, :method
    end

    def call_all
      planned = case IICallback.config.traversal
        when :preorder
          [self] + coactors
        when :postorder
          coactors + [self]
        when :inorder
          planned = coactors.in_groups(2, false)
          planned[0] + [self] + planned[1]
        end

      planned.each do |callback|
        if callback == self
          callback.call
        else
          callback.send(@context.method, @context.record)
        end
      end
    end

    def call
      send(@context.method) if respond_to?(@context.method)
    end

    class_methods do
      ActiveRecord::Callbacks::CALLBACKS.each do |callback|
        class_eval <<-RUBY, __FILE__, __LINE__
          def #{callback}(record)
            self.new(record: record, method: __method__).call_all
          end
        RUBY
      end
    end
  end
end