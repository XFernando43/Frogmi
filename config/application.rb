require_relative "boot"
require "rails/all"
require_relative '../lib/middleware/logger_middleware'

Bundler.require(*Rails.groups)

module Frogmi
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuración de middleware
    config.middleware.use LoggerMiddleware
  end
end
