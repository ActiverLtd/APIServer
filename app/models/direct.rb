class Direct < ActiveRecord::Base
	self.primary_keys = :user_id, :direct_id
	belongs_to :user
	belongs_to :direct, class_name: 'User'
end
