require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Projekt
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    config.eager_load_paths << Rails.root.join("lib")
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras"

    # Konfiguracja loggerow
    file_logger=ActiveSupport::Logger.new(Rails.root.join('log', "#{Rails.env}.log"))
    stdout_logger=ActiveSupport::Logger.new(STDOUT)


    multi_logger = ActiveSupport::Logger.new(Rails.root.join("log", "#{Rails.env}_multi.log"))
    multi_logger.formatter = ActiveSupport::Logger::Formatter.new

    logger = ActiveSupport::Logger.new(Rails.root.join("log", "#{Rails.env}.log"))
    logger.formatter = ActiveSupport::Logger::Formatter.new

    # config.logger = ActiveSupport::Logger.new(Rails.root.join("log", "#{Rails.env}.log"))
    config.logger = multi_logger

  end
end
