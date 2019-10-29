
Rails.application.routes.draw do
  resources :authors, only: [:show]
  resources :gossips, except: [:destroy, :edit, :update]
  resources :team, only: [:index]
  resources :contact, only: [:index]
  resources :welcome, only: [:index, :show]
end
