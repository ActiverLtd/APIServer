class User < ActiveRecord::Base
	include RailsSettings::Extend
	acts_as_token_authenticatable
	after_initialize :create_profile
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	has_one :profile
	accepts_nested_attributes_for :profile # This allows the profile attributes to be set as part of registration

	has_many :activity_shows
	has_many :accepted_activities, :class_name => 'Activity', through: :activity_shows

	def create_profile
		if new_record?
			Profile.create! :user => self
		end
	end

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			user.name = auth.info.name   # assuming the user model has a name
			user.image = auth.info.image # assuming the user model has an image
		end
	end

	def self.new_with_session(params, session)
		super.tap do |user|
			if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
				user.email = data["email"] if user.email.blank?
			end
		end
	end
end
