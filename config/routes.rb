APIServer::Application.routes.draw do
	get 'users/' => 'user#index'
	get 'profile/' => 'profiles#show'
	post 'profile/' => 'profiles#update'

	post 'users/facebook/' => 'omniauth#facebook'
	get 'suggestions/' => 'suggestion#index'
	get 'suggestions/:activity_id' => 'suggestion#show'

	resources :activity_types, :except => [:new, :edit]
	shallow do
		resources :activities, :except => [:new, :edit] do
			resources :suggestions, :except => [:new, :edit]
			resources :comments, :except => [:new, :edit]
		end
	end

	devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
end
