class ActivityTypesController < ApplicationController
	before_action :set_activity_type, only: [:show, :update, :destroy]
	before_filter :auth_admin_only, :except => :index
	respond_to :json

	swagger_api :index do
		summary "Lists all available Activity types"
		notes "This lists all available Activity types"
		param :path, :activity_id, :integer, :required, "Activity id"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def index
		@activity_types = ActivityType.all
		respond_with(@activity_types)
	end

	swagger_api :show do
		summary "Shows the Activity type"
		notes "Shows the Activity type"
		param :path, :id, :integer, :required, "Activity type id"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def show
		respond_with(@activity_type)
	end

	swagger_api :create do
		summary "Admin: Create a new Activity type"
		notes "This creates a new Activity type. This action requires Admin priviledges"
		param :form, :name, :string, :required, "Name"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def create
		@activity_type = ActivityType.new(activity_type_params)
		@activity_type.save
		respond_with @activity_type, status: :created
	end

	swagger_api :update do
		summary "Admin: Update the Activity type"
		notes "This updates an Activity type. This action requires Admin priviledges"
		param :path, :id, :integer, :required, "Activity type id"
		param :form, :name, :string, :optional, "Name"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def update
		@activity_type.update(activity_type_params)
		respond_with(@activity_type)
	end

	swagger_api :destroy do
		summary "Admin: Destroy the Activity type"
		notes "This destroys an Activity type. This action requires Admin priviledges"
		param :path, :id, :integer, :required, "Activity type id"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def destroy
		@activity_type.destroy
		respond_with(@activity_type)
	end

	private
	def set_activity_type
		@activity_type = ActivityType.find(params[:id])
	end

	def activity_type_params
		params.require(:activity_type).permit(:name, :style, :image_url)
	end
end
