class SuggestionsController < ApplicationController
	before_action :set_activity, only: [:create]
	before_action :set_suggestion, only: [:show, :update, :destroy]
	before_action :check_ownership, only: [:update, :destroy]
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
		if suggestion_params[:status] != 0 and suggestion_params[:status] != 1 # If the status isn't passed or invited
			render :json => {errors: "Can't create a suggestion unless it is of status passed or invited."}, status: :unprocessable_entity and return
		end
		@suggestion.user_id = current_user.id
		@suggestion.activity_id = @activity.id
		@suggestion.save
		respond_with(@suggestion)
	end

	swagger_api :update do
		summary "Updates the Suggestion"
		notes "This updates the Suggestion"
		param :path, :suggestion_id, :integer, :required, "Suggestion id"
		param :form, :status, :integer, :optional, "Status"
		response :unauthorized
		response :not_acceptable, "The request you made is not acceptable"
		response :unprocessable_entity
	end

	def update
		if !current_user.admin?
			if !@suggestion.invited? or suggestion_params[:status] != 2
				render :json => {errors: "Can't accept suggestion unless it is invitation in the first place."}, status: :unprocessable_entity and return
			elsif @suggestion.match?
				render :json => {errors: "The invitation was already accepted."}, status: :unprocessable_entity and return
			end
		end
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

	def check_ownership
		current_user == @suggestion.user or current_user.admin?
	end
end