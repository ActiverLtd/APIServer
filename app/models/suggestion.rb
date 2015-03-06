class Suggestion < ActiveRecord::Base
  enum status: [ :passed, :suggestion, :match ]
	belongs_to :inviter, :class_name => 'User'
	belongs_to :activity
end
