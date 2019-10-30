
Rails.application.routes.draw do
 
  resources :comments
  resources :authors, only: [:show]
  resources :cities, only: [:show]
  resources :gossips
  resources :team, only: [:index]
  resources :contact, only: [:index]
  resources :welcome, only: [:index, :show]
  root 'gossips#index'
end
