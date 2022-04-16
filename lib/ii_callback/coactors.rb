# frozen_string_literal: true

module IICallback
  module Coactors
    extend ActiveSupport::Concern

    included do
      include Coactive::Base

      configure_coactive do |config|
        config.load_paths = ['app/callbacks']
        config.class_suffix = 'Callback'
        config.use_cache = true
        config.lookup_superclass_until = ['ActiveRecord::Base', 'ActiveModel::Base']
      end
    end
  end
end
