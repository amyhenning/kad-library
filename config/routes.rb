Rails.application.routes.draw do
  devise_for :users
	root 'static_pages#index'
	get 'about', to: 'static_pages#about'
	get 'start_here', to: 'static_pages#start_here'
	get 'faq', to: 'static_pages#faq'
	get 'contact', to: 'static_pages#contact'
	get 'contribute', to: 'static_pages#contribute'
	resources :favorite_resources, only: [:create, :destroy]
	resources :resources do
		resources :reviews, only: [:create, :destroy]
	end
	resources :users, only: :show
end
