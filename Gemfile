source 'http://rubygems.org'

require 'rbconfig'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :test, :development do
	gem 'rspec-rails', '>= 2.0.0.beta'
	gem 'factory_girl_rails'
	gem 'guard-rspec'
end

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', require: false
end

gem 'eventmachine'
gem 'devise'
gem 'omniauth-facebook'
gem 'simple_token_authentication'
gem 'rails-settings-cached', '0.4.1'
gem 'composite_primary_keys', '=8.0.0' # This is used because Rails doesn't support composite primary keys and IS HEAVILY DEPENDANT OF RAILS VERSION

gem 'unicorn' # Use unicorn as the app server
gem 'unicorn-rails' # Serve unicorn as 'rails server'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debase'
gem 'ruby-debug-ide' #, group: [:development, :test]

#gem 'centurion'

gem 'swagger-docs'