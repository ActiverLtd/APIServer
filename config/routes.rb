APIServer::Application.routes.draw do
	get 'users/' => 'user#index'
	get 'profile/' => 'profiles#show'
	post 'profile/' => 'profiles#update'

	resources :activity_types
  resources :activities
	resources :invitations

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	get '/swagger' => 'pages#swagger'
end
