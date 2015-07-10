class ActivityType < ActiveRecord::Base
	has_many :activities, inverse_of: :activity_type, dependent: :destroy
	validates :name, presence: true, uniqueness: true
end
