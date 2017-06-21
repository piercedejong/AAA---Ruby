Rails.application.routes.draw do

  resources :games

  get 'users/new'

  get '/auth/google/callback', to: "users#create"

  get '/logout', to: "sessions#destroy", as: :logout

  get '/welcome', to: "welcome#show", as: :home

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
