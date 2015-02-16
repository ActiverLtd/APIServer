class ActivitiesController < ApplicationController
	before_action :set_activity, only: [:show, :update, :destroy]
	respond_to :json

	swagger_controller :activities, "Activity Management"

	swagger_api :index do
		summary "Fetches all Activities"
		notes "This lists all the active Activities"
		#param :query, :page, :integer, :optional, "Page number"
		param :path, :activity_type_id, :integer, :optional, "Activity type id"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def index
		if activity_params[:activity_type_id]
			@activities = Activity.find_by_activity_type_id(activity_params[:activity_type_id])
		else
			@activities = Activity.all
		end
		respond_with(@activities)
	end

	def show
		respond_with(@activity)
	end

	def create
		@activity = Activity.new(activity_params)
		@activity.organizer = current_user
		@activity.save
		respond_with(@activity)
	end

	def update
		@activity.update(activity_params)
		respond_with(@activity)
	end

	def destroy
		@activity.destroy
		respond_with(@activity)
	end

	private
	def set_activity
		@activity = Activity.find(params[:id])
	end

	def activity_params
		params.require(:activity).permit(:from, :to, :activity_type_id, :organizer, :message)
	end
end
