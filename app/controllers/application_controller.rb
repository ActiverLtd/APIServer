class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
	acts_as_token_authentication_handler_for User, except: [:facebook]
	respond_to :json

	rescue_from(ActionController::RoutingError) {
		render :json => {:error_message => "The resource you were looking for does not exist"}, status: :not_found
	}
	rescue_from Exception do |e|
		render :json => {:error_message => "We're sorry, but something went wrong. We've been notified about this issue and we'll take a look at it shortly.", :exception => {message: e.message, backtrace: e.backtrace.join('\n')}}, status: :internal_server_error
	end

	after_filter :cors_set_access_control_headers

	def cors_set_access_control_headers
		headers['Access-Control-Allow-Origin'] = '*'
		#headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
		#headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
		headers['Access-Control-Max-Age'] = "1728000"
	end

	protected

	def check_access (user)
		if current_user != user and not current_user.admin?
			render :json => {errors: 'The resource is not owned by you.'}, status: :forbidden
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


	def send_notification(user, text)
		_Gcm_notification user, text if true
		_Apn_notification user, text if false

	end

	def _Apn_notification(user, text)
		n = Rpush::Apns::Notification.new
		n.app = Rpush::Apns::App.find_by_name("Activer")
		n.device_token = user.device_token # 64-character hex string
		n.alert = text
		n.data = {message: text}
		n.save!
	end

	def _Gcm_notification(user, text)
		n = Rpush::Gcm::Notification.new
		n.app = Rpush::Gcm::App.find_by_name("Activer")
		n.registration_ids = ["APA91bFTz6izh23Lsmw0ZtVYHMeYiAeLKSYXNHOezVqA2dznrqqPc38ioIrJUipDq8Yji2ImLhIsNf1rVFWBM-EdyLB-OkqQWWXSP4VtWvu0j7HhUaKeNPJqPpoLc0vVzDgockefopeg"] #[user.registration_id]
		n.data = {message: text}
		n.save!
	end
end
