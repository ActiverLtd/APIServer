class Suggestion < ActiveRecord::Base
	enum status: [:passed, :invited, :match, :rejected]
	belongs_to :user, inverse_of: :suggestions
	belongs_to :activity, inverse_of: :suggestions

	validates_inclusion_of :status, in: Suggestion.statuses.keys
	validates :user, presence: true
	validates :activity, presence: true
end
