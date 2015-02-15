APIServer::Application.routes.draw do

	get 'users/' => 'user#index'
	get 'profile/' => 'profiles#show'
	post 'profile/' => 'profiles#update'

	resources :activity_types
  resources :activities

	get 'activity_shows/' => 'activity_shows#index'
	post 'activity_shows/' => 'activity_shows#create'
	put 'activity_shows/' => 'activity_shows#update'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	get '/swagger' => 'pages#swagger'
end
