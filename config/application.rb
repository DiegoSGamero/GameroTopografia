require_relative "boot"

require "rails"
require "rails/all"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GameroTopografia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # Set the default locale to Portuguese (Brazil)
    config.i18n.default_locale = :'pt-BR'

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Set eager load to true for production and false for other environments
    # config.eager_load = Rails.env.production?
    if Rails.env.production?
      config.eager_load = true
    elsif Rails.env.development? || Rails.env.test?
      config.eager_load = false
    end
  end
end
