class AddRootUsers < ActiveRecord::Migration
	def self.up
		User.create!(email: 'info@activer.net', password: 'password', role: 2, profile_attributes: {name: 'Activer Info'})
	end

	def self.down
		user = User.find_by_email('info@activer.net')
		user.destroy
	end
end