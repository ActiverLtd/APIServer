class Activity < ActiveRecord::Base
	acts_as_mappable :default_units => :kms,
	                 :default_formula => :sphere,
	                 :distance_field_name => :distance,
	                 :lat_column_name => :lat,
	                 :lng_column_name => :lng

	belongs_to :activity_type, inverse_of: :activities
	belongs_to :organizer, class_name: 'User', inverse_of: :activities
	has_many :suggestions, inverse_of: :activity, dependent: :destroy
	has_many :participants, -> { where suggestions: {status: 2} }, through: :suggestions, source: :user
	has_many :comments, inverse_of: :activity, dependent: :destroy

	validates :activity_type, presence: true
	validates :organizer, presence: true
	validates :from, presence: true
	validates :to, presence: true
	validates :participant_count, presence: true, numericality: {only_integer: true, greater_than: 1}
	validates :required_level, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
	validates :lat, presence: true, numericality: true
	validates :lng, presence: true, numericality: true
	validates :location_name, presence: true
end
