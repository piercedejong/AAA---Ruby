Rails.application.routes.draw do
  get 'users/new'

  get 'welcome/index'

  get '/auth/google/callback', to: "users#create"

  get '/logout', to: "sessions#destroy"

  get '/welcome', to: "welcome#show", as: :test

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
