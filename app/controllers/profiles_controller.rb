class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :update]
	respond_to :json

	swagger_api :show do
		summary "Shows the Profile"
		notes "This shows the information about the Profile of user"
		param :path, :user_id, :integer, :optional, "User id"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def show
		respond_with(@profile)
	end

	swagger_api :update do
		summary "Updates the Profile"
		notes "This updates the Profile"
		param :form, :image_url, :string, :optional, "Image URL"
		param :form, :first_name, :string, :optional, "First name"
		param :form, :last_name, :string, :optional, "Last name"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def update
		@profile.update(profile_params)
		respond_with(@profile)
	end

	private
	def set_profile
		@profile = current_user.profile
	end

	def profile_params
		params.require(:profile).permit(:name, :description, :picture, :born, :registered, :rating_mean, :rating_count, :user_id)
	end
end
