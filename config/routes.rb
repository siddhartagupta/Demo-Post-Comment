Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
	root to: "home#index"
  resources :welcome, only: [:index]
   resources :posts do
   	resources :comments 
   end
	resources :images do
		resources :comments 
	end
   resources :home, only: [:index]
   resources :about, only: [:index]
end
