Rails.application.routes.draw do
  devise_for :users
	root 'static_pages#index'
	get 'about', to: 'static_pages#about'
	resources :resources
	resources :favorite_resources, only: [:create, :destroy]
end
