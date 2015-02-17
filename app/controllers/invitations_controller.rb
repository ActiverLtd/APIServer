class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]
  respond_to :json

  swagger_controller :invitations, "Invitations Management"

  swagger_api :index do
	  summary "Returns users pending Invitations"
	  notes "This lists all the active Invitations for current user"
	  response :unauthorized
	  response :not_acceptable, "The request you made is not acceptable"
  end

  def index
    @invitations = Invitation.all
    respond_with(@invitations)
  end

  swagger_api :show do
    summary "Shows the Invitation"
    notes "This shows the Invitation"
    param :path, :id, :integer, :required, "Invitation id"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end

  def show
    respond_with(@invitation)
  end

  swagger_api :create do
    summary "Creates an Invitation AKA invite"
    notes "This creates the Invitation, invites on other words"
    param :path, :activity_id, :integer, :required, "Activity id"
    param :form, :chat_message, :string, :optional, "Chat message"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.save
    respond_with(@invitation)
  end

  swagger_api :update do
    summary "Updates the Invitation"
    notes "This updates the Invitation"
    param :path, :invitation_id, :integer, :required, "Invitation id"
    param :form, :accepted, :boolean, :optional, "Accepted"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end

  def update
    @invitation.update(invitation_params)
    respond_with(@invitation)
  end

  def destroy
    @invitation.destroy
    respond_with(@invitation)
  end

  private
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    def invitation_params
      params.require(:invitation).permit(:activity_id, :user_id, :accepted)
    end
end
