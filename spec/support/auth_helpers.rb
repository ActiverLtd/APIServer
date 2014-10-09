# These do not work as request isn't set yet at here..
module AuthHelpers
	def authWithUser (user)
		request.headers['X-User-Token'] = "#{user.authentication_token}"
		request.headers['X-User-Email'] = "#{user.email}"
	end

	def clearToken
		request.headers['X-User-Token'] = nil
	end

	def clearEmail
		request.headers['X-User-Email'] = nil
	end

	def clear
		request.headers['X-User-Token'] = nil
		request.headers['X-User-Email'] = nil
	end
end