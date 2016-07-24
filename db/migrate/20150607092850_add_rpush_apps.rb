class AddRpushApps < ActiveRecord::Migration
	def self.up
		Rpush::Gcm::App.create!(name: 'Activer_Gcm', auth_key: 'AIzaSyCToUsHSrpZVnLL_ZcsaDayde5YjHjsQLU', connections: 1) if Rails.env.production?
		Rpush::Apns::App.create!(name: 'Activer_Apns', certificate: ENV['APNS_PEM'], environment: 'sandbox', password: 'password', connections: 1) if Rails.env.production?
		#Rpush::Wpns::App.create!({name: 'Activer_Wpns', connections: 1})
	end

	def self.down
	end
end