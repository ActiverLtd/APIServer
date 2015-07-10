class User < ActiveRecord::Base
	include RailsSettings::Extend
	acts_as_token_authenticatable

	enum notification_system: [:Gcm, :Apns, :Wpns]

	enum role: [:user, :vip, :admin]
	after_initialize :set_default_role, if: :new_record?

	def set_default_role
		self.role ||= :user
	end

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	has_one :profile, inverse_of: :user, dependent: :destroy
	default_scope { includes(:profile) } # Always include profile
	accepts_nested_attributes_for :profile # This allows the profile attributes to be set as part of registration

	has_many :activities, foreign_key: 'organizer_id', inverse_of: :organizer, dependent: :destroy
	has_many :suggestions, inverse_of: :user, dependent: :destroy
	has_many :directs, inverse_of: :user, dependent: :destroy
	has_many :direct_users, through: :directs, class_name: :user, inverse_of: :direct
	has_many :comments, inverse_of: :user, dependent: :destroy
	#has_many :upcoming_activities, -> { where ' = 1 AND from >= #{DateTime.now.to_date}' }, class_name: :suggestion

	validates_inclusion_of :role, in: User.roles.keys

	def as_json(options = {})
		super(options.merge({#except: [:authentication_token],
		                     include: :profile}))
	end

	def activity_count
		Rails.cache.fetch("#{cache_key}/activity_count", expires_in: 12.hours) do
			self.activities.size + self.suggestions.where(status: Suggestion.statuses[:match]).size
		end
	end

	def self.from_omniauth(auth)
		where(provider: auth[:provider], uid: auth[:id]).first_or_create do |user|
			user.email = auth[:email]
			user.password = Devise.friendly_token[0, 20]

			user.create_profile({name: auth[:name], born: auth[:birthday], picture: auth[:picture][:data][:url]})

			user.profile.male = true if auth[:gender] == 'male'
			user.profile.male = false if auth[:gender] == 'female'
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
