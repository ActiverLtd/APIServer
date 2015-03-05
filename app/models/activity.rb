class Activity < ActiveRecord::Base
	belongs_to :activity_type
	belongs_to :organizer, :class_name => 'User'
	has_many :invitations
	has_many :participants, -> { where accepted: true }, :through => :invitations, :class_name => 'User'
	has_many :comments
end
