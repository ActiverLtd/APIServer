class UserController < ApplicationController
	respond_to :json
	before_action :set_user, only: :destroy
	before_action -> { check_access @user }, only: :destroy

	def index
		respond_with current_user
	end

	def destroy #TODO: This is shadowed by devise if is added to the routes
		@user.destroy
		respond_with @user
	end

	private

	def set_user
		@user = User.find(params[:id])
	end
end
