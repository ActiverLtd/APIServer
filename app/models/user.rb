class User < ActiveRecord::Base
	include RailsSettings::Extend
	acts_as_token_authenticatable
	after_initialize :create_profile
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	has_one :profile
	accepts_nested_attributes_for :profile # This allows the profile attributes to be set as part of registration

	has_many :activity_shows
	has_many :accepted_activities, :class_name => 'Activity', through: :activity_shows

	def create_profile
		if new_record?
			Profile.create! :user => self
		end
	end
end
