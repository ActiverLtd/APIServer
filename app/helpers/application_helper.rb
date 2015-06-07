module ApplicationHelper
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
