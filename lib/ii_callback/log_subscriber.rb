# frozen_string_literal: true

module IICallback
  class LogSubscriber < ActiveSupport::LogSubscriber
    def calling(event)
      debug do
        callback = event.payload[:callback]
        "Calling #{callback.class} with #{callback.context}"
      end
    end

    def call(event)
      debug do
        callback = event.payload[:callback]
        "Called #{callback.class} (#{additional_log(event)})"
      end
    end

    private

    def additional_log(event)
      additions = ["Duration: %.1fms" % event.duration]
      additions << "Allocations: %d" % event.allocations if event.respond_to?(:allocations)
      additions.join(', ')
    end
  end
end
