# frozen_string_literal: true

module IICallback
  module Instrumentation
    extend ActiveSupport::Concern

    def call_all
      ActiveSupport::Notifications.instrument 'calling.ii_callback', callback: self
      super
    end

    def call
      ActiveSupport::Notifications.instrument 'call.ii_callback', callback: self do
        super
      end
    end
  end
end
