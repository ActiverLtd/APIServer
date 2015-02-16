class Invitation < ActiveRecord::Base
	belongs_to :inviter, :class_name => 'User'
	belongs_to :activity
end
