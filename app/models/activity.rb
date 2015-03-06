class Activity < ActiveRecord::Base
	belongs_to :activity_type
	belongs_to :organizer, :class_name => 'User'
	has_many :suggestions
	has_many :participants, -> { where accepted: true }, :through => :suggestions, :class_name => 'User'
	has_many :comments
end
