Rails.application.routes.draw do
  get 'users/new'

  get '/auth/google/callback', to: "users#create"

  get '/logout', to: "sessions#destroy", as: :logout

  get '/welcome', to: "welcome#show", as: :home

  get '/new', to: "welcome#new", as: :new

  get '/load', to: "welcome#load", as: :load

  get '/game', to: "game#index", as: :game

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
