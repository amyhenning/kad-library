Rails.application.routes.draw do
  devise_for :users
	root 'resources#index'
	resources :resources
	resources :favorite_resources, only: [:create, :destroy]
end
