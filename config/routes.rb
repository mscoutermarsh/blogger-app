Rails.application.routes.draw do
  resources :authors

  resources :categories

  resources :posts

  root to: 'visitors#index'
end
