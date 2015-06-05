APIServer::Application.routes.draw do
	get 'users/' => 'user#index'
	get 'profile/' => 'profiles#show'
	post 'profile/' => 'profiles#update'

	post 'users/facebook/' => 'omniauth#facebook'

	get 'activities/my' => 'activities#my'

	get 'suggestions/' => 'suggestions#index'
	get 'suggestions/:activity_id' => 'suggestions#show'

	resources :directs, only: [:index, :create, :destroy]

	resources :activity_types, except: [:new, :edit]
	shallow do
		resources :activities, except: [:new, :edit] do
			resources :suggestions, except: [:new, :edit]
			resources :comments, except: [:new, :edit]
		end
	end

	devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
end
