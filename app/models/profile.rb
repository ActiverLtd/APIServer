class Profile < ActiveRecord::Base
	belongs_to :user, :dependent => :destroy
	has_many :profile_settings

	validates :range, numericality: {only_integer: true}, allow_blank: true
	#validates :user_id, allow_nil: false

	def is_direct(current_user)
		current_user.directs.collect { |a| a.direct }.include? self.user
	end
end
