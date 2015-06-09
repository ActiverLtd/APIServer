# As cacert.pem isn't found by Ruby Net::HTTP automatically
# it needs to be pointed by re-opening the class and setting ca_file when use_ssl is set on
# If the security isn't too big of a concern (debugging), the following can be used to completely disable the checks:
#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

require 'open-uri'
require 'net/https'

module Net
	class HTTP
		alias_method :original_use_ssl=, :use_ssl=

		def use_ssl=(flag)
			self.ca_file = "/app/config/cacert.pem"
			self.verify_mode = OpenSSL::SSL::VERIFY_PEER
			self.original_use_ssl = flag
		end
	end
end
