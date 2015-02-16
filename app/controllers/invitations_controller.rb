class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]
  respond_to :json

  swagger_controller :invitations, "Invitations Management"

  swagger_api :index do
	  summary "Fetches all Invitations"
	  notes "This lists all the active Invitations for current user"
	  #param :query, :page, :integer, :optional, "Page number"
	  response :unauthorized
	  response :not_acceptable, "The request you made is not acceptable"
  end


  def index
    @invitations = Invitation.all
    respond_with(@invitations)
  end

  def show
    respond_with(@invitation)
  end

  def new
    @invitation = Invitation.new
    respond_with(@invitation)
  end

  def edit
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.save
    respond_with(@invitation)
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
