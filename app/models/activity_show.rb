class ActivityShow < ActiveRecord::Base
	self.primary_keys = :user_id, :activity_id
	belongs_to :user
	belongs_to :activity
	has_one :activity_type, through: :activity
end
