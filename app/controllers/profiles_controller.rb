class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show,  :update]
  respond_to :json

  def show
    respond_with(@profile)
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
      params.require(:profile).permit(:name, :description, :picture, :born, :registered, :range, :rating_mean, :rating_count, :user_id)
    end
end
