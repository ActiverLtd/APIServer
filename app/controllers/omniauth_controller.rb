class OmniauthController < ApplicationController
	respond_to :json

	def facebook
		@user = User.from_omniauth(params.merge({provider: 'facebook'}))
		render json: @user
	end
end
