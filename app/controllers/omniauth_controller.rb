class OmniauthController < ActionController::Base
	respond_to :json

	def facebook
		@user = User.from_omniauth(params.merge({provider: 'facebook'}))
		respond_with @user
	end
end
