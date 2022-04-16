# frozen_string_literal: true

module IICallback
  class Context < Coactive::Context
    def to_s
      "#<#{self.class} record=#{@_data[:record]} method=#{@_data[:method]}>"
    end
  end
end
