class SuggestionsController < ApplicationController
	before_action :set_activity, only: [:create]
	before_action :set_suggestion, only: [:show, :edit, :update, :destroy]
	respond_to :json

	swagger_controller :suggestions, "Suggestions Management"

	swagger_api :index do
		summary "Returns users pending Suggestions"
		notes "This lists all the active Suggestions for current user"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def index
		@suggestions = Suggestion.all
		respond_with(@suggestions)
	end

	swagger_api :show do
		summary "Shows the Suggestion"
		notes "This shows the Suggestion"
		param :path, :id, :integer, :required, "Suggestion id"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def show
		respond_with(@suggestion)
	end

	swagger_api :create do
		summary "Creates an Suggestion AKA invite"
		notes "This creates the Suggestion, invites on other words"
		param :path, :activity_id, :integer, :required, "Activity id"
		param :form, :chat_message, :string, :optional, "Chat message"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def create
		@suggestion = Suggestion.new(suggestion_params)
		@suggestion.user_id = current_user.id
		@suggestion.activity_id = @activity.id
		@suggestion.save
		respond_with(@suggestion)
	end

	swagger_api :update do
		summary "Updates the Suggestion"
		notes "This updates the Suggestion"
		param :path, :suggestion_id, :integer, :required, "Suggestion id"
		param :form, :status, :integer, :optional, "Accepted"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
	end

	def update
		@suggestion.update(suggestion_params)
		respond_with(@suggestion)
	end

	def destroy
		@suggestion.destroy
		respond_with(@suggestion)
	end

	private

	def set_activity
		@activity = Activity.find(params[:activity_id])
	end

	def set_suggestion
		@suggestion = Suggestion.find(params[:id])
	end

	def suggestion_params
		params.require(:suggestion).permit(:status)
	end
end
