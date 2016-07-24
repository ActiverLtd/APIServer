source 'http://rubygems.org'

require 'rbconfig'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.2'

group :production do
	gem 'puma', '~> 2.15'
	gem 'rails_12factor', '~> 0.0'
	gem 'pg', '~> 0.18'
end

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.4'

group :test, :development do
	gem 'sqlite3'
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

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem 'swagger-docs'