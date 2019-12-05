require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get 'mailers/create'
  get 'home/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#show"

  resources :mailers, only: [:create]

  get "/sent", to: "mailers#sent"
end
