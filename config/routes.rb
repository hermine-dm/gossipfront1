
Rails.application.routes.draw do
  resources :gossips do
    resources :like, only: [:index, :create, :destroy]
  end
  resources :gossips do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :authors, only: [:show, :create, :new]
  resources :cities, only: [:show]
  resources :team, only: [:index]
  resources :contact, only: [:index]
  resources :welcome, only: [:index, :show]
  root to: 'gossips#index'
end
