
Rails.application.routes.draw do
  get 'authors', to: 'home#show'
  get 'authors/:id', to: 'authors#show', as: :authors_id
  get 'gossips', to: 'home#show'
  get 'gossips/:id', to: 'gossips#show', as: :gossips_id
  get 'home', to: 'home#show'
  get '/', to: 'home#show'
  get 'welcome', to: 'welcome#show'
  get 'welcome/:first_name', to: 'welcome#show'
  get 'contact', to: 'contact#show' #va a la page contact en prenant la vision show
  get 'team', to: 'team#show' 
end
