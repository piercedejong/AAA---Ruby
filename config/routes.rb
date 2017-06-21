Rails.application.routes.draw do
  get 'users/new'

  get '/auth/google/callback', to: "users#create"

  get '/logout', to: "sessions#destroy", as: :logout

  get '/welcome', to: "welcome#show", as: :home

  get '/new', to: "game#new", as: :new

  get '/index', to: "game#index", as: :index

  get '/game', to: "game#show", as: :show

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
