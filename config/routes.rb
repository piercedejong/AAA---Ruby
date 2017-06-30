Rails.application.routes.draw do

  resources :games

  resources :nations

  resources :units

  get 'users/new'

  get '/auth/google/callback', to: "users#create"

  get '/logout', to: "sessions#destroy", as: :logout

  get '/welcome', to: "welcome#show", as: :home

  get '/game/end_turn', to: 'games#end_turn'

  get '/game/buy_unit', to: 'games#buy_unit'

  get '/game/reset_buy', to: 'games#reset_buy'

  get '/game/change_eco', to: 'games#change_eco'

  get '/game/change_bank', to: 'games#change_bank'

  get '/game/change_income', to: 'games#change_income'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
