APIServer::Application.routes.draw do
	get 'users/' => 'user#index'
	get 'profile/' => 'profiles#show'
	post 'profile/' => 'profiles#update'

	resources :activity_types
	resources :suggestions
	shallow do
		resources :activities do
			resources :comments
		end
	end

	devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
end
