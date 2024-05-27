require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Converter
  class Application < Rails::Application
    config.load_defaults 7.1

    # Load the currency.rb file
    currency_file = Rails.root.join('app', 'api', 'converter', 'currency.rb')
    require currency_file if File.exist?(currency_file)

    # Add any other autoload paths
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
  end
end
