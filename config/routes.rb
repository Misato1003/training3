Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root to: "cooks#index"
  get 'favorites/index'
  get 'posts/index'
  get 'cooks/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cooks
  resources :posts
  resources :favarites
  
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  post 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  
  resources :users, only: [:show]
end  
  
