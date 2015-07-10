class Comment < ActiveRecord::Base
	belongs_to :user, :foreign_key => 'writer', inverse_of: :comments
	belongs_to :activity, inverse_of: :comments

	validates :text, presence: true, length: {minimum: 1}
	validates_presence_of :user
	validates_presence_of :activity
end
