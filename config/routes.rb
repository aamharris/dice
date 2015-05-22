Rails.application.routes.draw do
  root 'games#new'

  resources :welcome, only: [:index]
  resources :games, only: [:index, :create, :new]

  get '/rolldice', to: 'games#rolldice', as: 'roll_dice'
   
end
