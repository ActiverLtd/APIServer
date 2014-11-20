namespace :environment do
	task :common do
		set :image, 'seapy/rails-nginx-unicorn'
		# Point this to an appropriate health check endpoint for rolling deploys (defaults to '/')
		# set :status_endpoint, '/status/check'
		# Example on how to change docker registry to Dogestry.
		# This requires:
		# - aws_access_key_id
		# - aws_secret_key
		# - s3_bucket
		#
		# And optionally:
		# - s3_region (default to us-east-1)
		#
		# registry :dogestry
		# set :aws_access_key_id, 'abc123'
		# set :aws_secret_key, 'xyz'
		# set :s3_bucket, 'bucket-for-docker-images'
	end
	desc 'Staging environment'
	task :staging => :common do
		set_current_environment(:staging)
		# env_vars YOUR_ENV: 'staging'
		# host_port 10234, container_port: 9292
		# host 'docker-server-staging-1.example.com'
		# host 'docker-server-staging-2.example.com'
		# You can assign different docker daemon port. Example:
		# host 'docker-server-staging-3.example.com:4243'
	end
	desc 'Production environment'
	task :production => :common do
		set_current_environment(:production)
		# env_vars YOUR_ENV: 'production'
		# host_port 23235, container_port: 9293
		host 'api.activer.net'
		# host 'docker-server-prod-2.example.com'
		# host_volume '/mnt/volume1', container_volume: '/mnt/volume1'
	end
end
