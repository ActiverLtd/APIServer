source 'http://rubygems.org'

require 'rbconfig'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :test, :development do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
	gem 'guard-rspec'

	# Use debugger
	gem 'debase'
end

gem 'eventmachine'
gem 'devise'
gem 'omniauth-facebook'
gem 'simple_token_authentication'
gem 'rails-settings-cached', '0.4.1'
gem 'composite_primary_keys', '=8.0.0' # This is used because Rails doesn't support composite primary keys and IS HEAVILY DEPENDANT OF RAILS VERSION
gem 'rpush'
gem 'geokit-rails'

platforms :ruby do # linux
	gem 'unicorn' # Use unicorn as the app server
	gem 'unicorn-rails' # Serve unicorn as 'rails server'
end

platforms :mswin do
	# gems specific to windows
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'swagger-docs'