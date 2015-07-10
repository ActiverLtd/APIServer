class Direct < ActiveRecord::Base
	self.primary_keys = :user_id, :direct_id
	belongs_to :user, inverse_of: :directs
	belongs_to :direct, class_name: 'User', inverse_of: :direct_users

	validates_presence_of :user
	validates_presence_of :direct
end
