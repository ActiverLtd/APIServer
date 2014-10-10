class Profile < ActiveRecord::Base
	belongs_to :user, :dependent => :destroy
	has_many :profile_settings
end
