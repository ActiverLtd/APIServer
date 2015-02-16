class Activity < ActiveRecord::Base
	belongs_to :activity_type
	belongs_to :organizer, :class_name => 'User'
	has_many :invitations
end
