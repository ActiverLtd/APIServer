class Activity < ActiveRecord::Base
	belongs_to :activity_type
	belongs_to :organizer, :class_name => 'User'
	has_many :activity_shows
	has_many :accepters, :class_name => 'User', through: :activity_shows
end
