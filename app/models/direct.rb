class Direct < ActiveRecord::Base
	self.primary_keys = :user_id, :direct_id
	belongs_to :user
	has_one :direct, class_name: 'User'
end
