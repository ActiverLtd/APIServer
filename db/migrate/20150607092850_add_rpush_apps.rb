class AddRpushApps < ActiveRecord::Migration
	def self.up
		Rpush::Gcm::App.create!(name: 'Activer', auth_key: 'AIzaSyCToUsHSrpZVnLL_ZcsaDayde5YjHjsQLU', certificate: File.read("config/cacert.pem"), connections: 1)
		#Rpush::Apns::App.create!(name: 'Activer', certificate: '', environment: '', password: '', connections: 1)
	end

	def self.down
	end
end