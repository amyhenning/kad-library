Rails.application.routes.draw do
	root 'resources#index'
	resources :resources
end
