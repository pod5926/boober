require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module App1
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework :rspec,
                        helper_specs: false,
                        routing_specs: false,
                        view_specs: false,
                        controller_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
    config.generators.system_tests = nil
  end
end
