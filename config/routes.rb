Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :image_mappers
    resources :banners do
    	member do
          get :pin
        end
    end	
  end
end
