class Comment < ActiveRecord::Base
	belongs_to :user, :foreign_key => 'writer'
	belongs_to :activity

	validates :writer, presence: true, allow_nil: false
end
