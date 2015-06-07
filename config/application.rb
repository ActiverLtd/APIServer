require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module APIServer
	class Application < Rails::Application
		# Settings in config/environments/* take precedence over those specified here.
		# Application configuration should go into files in config/initializers
		# -- all .rb files in that directory are automatically loaded.

		# Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
		# Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
		# config.time_zone = 'Central Time (US & Canada)'

		# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
		# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
		# config.i18n.default_locale = :de

		config.after_initialize do
			#app = Rpush::Apns::App.new
			#app.name = "Activer"
			#app.certificate = File.read("/path/to/sandbox.pem")
			#app.environment = "sandbox" # APNs environment.
			#app.password = "certificate password"
			#app.connections = 1
			#app.save!

			#unless Rpush::Gcm::App.exists?(name: "Activer")
			#	app = Rpush::Gcm::App.new
			#	app.name = 'Activer'
			#	app.certificate = File.read("config/cacert.pem")
			#	app.auth_key = 'AIzaSyCToUsHSrpZVnLL_ZcsaDayde5YjHjsQLU'
			#	app.connections = 1
			#	app.save!
			#end
		end
	end
end
