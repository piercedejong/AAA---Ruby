require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Aaa
  class Application < Rails::Application
    #config.autoload_paths << Rails.root.join('lib')
    config.active_record.primary_key = :uuid

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.assets.enabled = true
    #config.eager_load_paths += %W( #{config.root}/lib )
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
