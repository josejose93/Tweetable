Rails.application.routes.draw do
  # resources :comments
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "tweets#index"
  resources :tweets do
    resources :comments
  end
end
