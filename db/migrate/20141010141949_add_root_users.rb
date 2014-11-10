class AddRootUsers < ActiveRecord::Migration
	def self.up
		user = User.create!( :email => 'info@activer.net', :password => 'password', :admin => true )
	end

	def self.down
		user = User.find_by_email( 'info@activer.net' )
		user.destroy
	end
end