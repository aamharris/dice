Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcome, only: [:index]
  resources :game, only: [:index, :create, :current]
   
end
