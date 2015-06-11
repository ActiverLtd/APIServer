class Profile < ActiveRecord::Base
	belongs_to :user, :dependent => :destroy
	has_many :profile_settings

	#validates :user_id, allow_nil: false

	def is_direct(current_user)
		current_user.directs.collect { |a| a.direct }.include? self.user
	end

	def activity_count
		self.user.activity_count
	end
end
