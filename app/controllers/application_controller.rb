class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
	acts_as_token_authentication_handler_for User
	respond_to :json

	rescue_from(ActionController::RoutingError) {
		render :json => {:error_message => "The resource you were looking for does not exist"}
	}
	rescue_from(Exception) {
		render :json => {:error_message => "We're sorry, but something went wrong. We've been notified about this issue and we'll take a look at it shortly."}
	}

	after_filter :cors_set_access_control_headers

	def cors_set_access_control_headers
		headers['Access-Control-Allow-Origin'] = '*'
		#headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
		#headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
		headers['Access-Control-Max-Age'] = "1728000"
	end

	protected

	def check_access (user)
		if current_user != user or current_user.admin?
			render :json => {errors: "The resource is not owned by you."}, status: :forbidden
		end
	end

	def auth_vip_required
		unless current_user.vip?
			render :json => {error: 'Only allowed for VIP users.'}, :status => :forbidden
		end
	end

	def auth_admin_only
		unless current_user.admin?
			render :json => {error: 'Only allowed for Admin users.'}, :status => :forbidden
		end
	end

	def secure_params
		params.require(:user).permit(:role)
	end
end
