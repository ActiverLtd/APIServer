class Profile < ActiveRecord::Base
	belongs_to :user, inverse_of: :profile
	has_many :profile_settings

	validates_presence_of :user
	validates :name, presence: true, length: {minimum: 4}

	def is_direct(current_user)
		current_user.directs.collect { |a| a.direct }.include? self.user
	end

	def activity_count
		self.user.activity_count
	end
end
