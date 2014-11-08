Rails.application.config.middleware.use OmniAuth::Builder do

	if RbConfig::CONFIG["host_os"] =~ /mingw|mswin/
		ca_file = File.expand_path Rails.root.join("config", "cacert.pem")

		ssl_options = {}
		ssl_options[:ca_path] = '/etc/ssl/certs' if Rails.env.staging?
		ssl_options[:ca_file] = ca_file

		provider :facebook, 375866282577187, 'a637d14e4f6a8829a3c468c3672f99bd', {provider_ignores_state: true, :client_options => {:ssl => ssl_options}}
	else
		provider :facebook, 375866282577187, 'a637d14e4f6a8829a3c468c3672f99bd', {provider_ignores_state: true}
	end
end