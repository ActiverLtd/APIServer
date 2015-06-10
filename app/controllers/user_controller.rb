class UserController < ApplicationController
	respond_to :json
	before_action -> { check_access current_user }, only: [:update, :destroy]

	def index
		respond_with current_user
	end

	def update
		current_user.update(user_params)
		respond_with(current_user)
	end

	def destroy
		current_user.destroy
		respond_with current_user
	end

	private

	def user_params
		params.require(:user).permit(:notification_system, :notification_id)
	end
end
