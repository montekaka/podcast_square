Rails.application.routes.draw do
  resources :reviews
  resources :podcasts
  resources :podcasts do 
  	resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
