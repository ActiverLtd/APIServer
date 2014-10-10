class Profile < ActiveRecord::Base
	belongs_to :user, :dependent => :destroy
	has_many :profile_settings

	validates :range, numericality: { only_integer: true }, allow_blank: true
end
