require 'active_support'
require 'coactive'

require 'ii_callback/version'
require 'ii_callback/config'
require 'ii_callback/base'
require 'ii_callback/log_subscriber'

module IICallback
  class << self
    def configure
      yield Config
    end

    def config
      Config
    end
  end
end
