Rails.application.routes.draw do
  devise_for :users
	root 'static_pages#index'
	get 'about', to: 'static_pages#about'
	get 'start_here', to: 'static_pages#start_here'
	resources :resources
	resources :favorite_resources, only: [:create, :destroy]
end
