Rails.application.routes.draw do
  devise_for :users
  root to: "cooks#index"
  get 'favorites/index'
  get 'posts/index'
  get 'cooks/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cooks
  resources :posts
  
end  
  
