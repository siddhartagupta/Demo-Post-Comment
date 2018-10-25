Rails.application.routes.draw do
  devise_for :users
	root to: "home#index"

   resources :posts do
   	resources :comments 
   end
	resources :images do
		resources :image_comments
	end
   resources :home, only: [:index]
   resources :about, only: [:index]
end
