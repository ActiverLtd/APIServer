class ActivityShowsController < ApplicationController
	before_action :set_activity_show, only: [:show, :update, :destroy]
	respond_to :json

	def index
		@activity_shows = ActivityShow.all
		respond_with(@activity_shows)
	end

	def show
		respond_with(@activity_show)
	end

	def create
		@activity_show = ActivityShow.new(activity_show_params)
		@activity_show.user = current_user
		@activity_show.save
		render :nothing => true, :status => 201
	end

	def update
		@activity_show.update(activity_show_params)
		respond_with(@activity_show)
	end

	def destroy
		@activity_show.destroy
		respond_with(@activity_show)
	end

	private
	def set_activity_show
		@activity_show = current_user.activity_shows.find_by_activity_id(activity_show_params[:activity_id])
	end

	def activity_show_params
		params.require(:activity_show).permit(:user_id, :activity_id, :accepted)
	end
end
