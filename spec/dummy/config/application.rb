require_relative 'boot'

require "active_record/railtie"
require "active_job/railtie"

Bundler.require(*Rails.groups)
require "ii_callback"

module Dummy
  class Application < Rails::Application
    config.after_initialize do
      IICallback::LogSubscriber.attach_to(:ii_callback)
    end
  end
end
