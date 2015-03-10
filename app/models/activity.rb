class Activity < ActiveRecord::Base
	belongs_to :activity_type
	belongs_to :organizer, class_name: 'User'
	has_many :suggestions, dependent: :destroy
	has_many :participants, -> { where suggestions: {status: 1} }, through: :suggestions, source: :user
	has_many :comments, dependent: :destroy

	validates :activity_type_id, presence: true
	validates :organizer, presence: true
	validates :from, presence: true
	validates :to, presence: true
end
