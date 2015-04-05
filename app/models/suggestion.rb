class Suggestion < ActiveRecord::Base
	enum status: [:passed, :invited, :match, :rejected]
	belongs_to :user
	belongs_to :activity

	validates :status, presence: true
	validates :user_id, presence: true, uniqueness: {scope: :activity_id}
	validates :activity_id, presence: true
end
