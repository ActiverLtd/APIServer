class ActivityShow < ActiveRecord::Base
	belongs_to :user
	belongs_to :activity
	has_one :activity_type, through: :activity
end
