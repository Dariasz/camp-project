require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MBL02
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller
    config.time_zone = 'Warsaw'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = %i[pl en]
    config.i18n.default_locale = :en

    # Rails generate custom config
    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.helper = false
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
