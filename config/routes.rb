Rails.application.routes.draw do
  get 'users/new'

  get '/auth/google/callback', to: "users#create"

  get '/logout', to: "sessions#destroy", as: :logout

  get '/welcome', to: "welcome#show", as: :home

  get '/newGame', to: "game_data#new", as: :new

  get '/loadGame', to: "game_data#load", as: :load

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
