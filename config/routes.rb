Rails.application.routes.draw do

  resources :games

  resources :nations

  resources :units

  resources :victories

  resources :researches

  get 'battle_calculator/simulation', to: 'battle_calculator#simulation', :as => :simulation

  resources :battle_calculator

  get 'users/new'

  get '/auth/google/callback', to: "users#create"

  get '/user/toggle_background', to: "users#toggle_background"

  get '/logout', to: "sessions#destroy", as: :logout

  get '/welcome', to: "welcome#index", as: :home

  delete '/game/destroy_all', to: 'games#destroy_all'

  get '/game/copy', to: 'games#copy'

  get '/game/end_turn', to: 'games#end_turn'

  get '/game/buy_unit', to: 'games#buy_unit'

  get '/game/reset_buy', to: 'games#reset_buy'

  get '/game/change_eco', to: 'games#change_eco'

  get '/game/change_bank', to: 'games#change_bank'

  get '/game/change_income', to: 'games#change_income'

  get '/game/edit_change_bank', to: 'games#edit_change_bank'

  get '/game/edit_change_income', to: 'games#edit_change_income'

  get '/game/buy_pacific', to: 'games#buy_pacific'

  get 'game/objectives', to: 'games#objectives', as: :objectives

  get 'game/reset_victory_research', to: 'games#reset_victory_research'

  get 'nation/show', to: 'nations#show'

  get 'nation/clicked', to: 'nations#clicked'

  get 'victory/clicked', to: 'victories#clicked'

  get 'research/clicked', to: 'researches#clicked'





  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
