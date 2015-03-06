class Suggestion < ActiveRecord::Base
  enum status: [ :passed, :suggestion, :match ]
	belongs_to :user
	belongs_to :activity
end
