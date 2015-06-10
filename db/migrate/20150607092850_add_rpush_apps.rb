class AddRpushApps < ActiveRecord::Migration
	def self.up
		Rpush::Gcm::App.create!(name: 'Activer_Gcm', auth_key: 'AIzaSyCToUsHSrpZVnLL_ZcsaDayde5YjHjsQLU', connections: 1)
		Rpush::Apns::App.create!(name: 'Activer_Apns', certificate: File.read('/etc/ssl/activer_apns_sandbox.pem') + File.read('/etc/ssl/activer_apns_sandbox.key'), environment: 'sandbox', password: 'password', connections: 1)
		#Rpush::Wpns::App.create!({name: 'Activer_Wpns', connections: 1})
	end

	def self.down
	end
end