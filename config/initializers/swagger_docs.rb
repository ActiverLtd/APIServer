Swagger::Docs::Config.register_apis(
		{
				"1.0" => {
						# the extension used for the API
						:api_extension_type => :json,
						# the output location where your .json files are written to
						:api_file_path => "public/",
						# the URL base path to your API
						:base_path => "https://api.activet.net",
						# if you want to delete all .json files at each generation
						:clean_directory => false,
						# add custom attributes to api-docs
						:attributes => {
								:info => {
										"title" => "Activer",
										"description" => "Activer",
										"termsOfServiceUrl" => "https://api.activer.net/terms/",
										"contact" => "info@activer.net",
										"license" => "Apache 2.0",
										"licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
								}
						}
				}
		})