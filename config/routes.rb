Rails.application.routes.draw do
  resources :deck_cards
  resources :user_decks
  resources :cards
  resources :decks
  resources :users

  # get '/profile', to: 'users/show', as: 'profile'
  # get '/login', to: 'sessions#new', as: 'login'
  # post 'login', to: 'sessions#new'

  post '/cards/add_to_deck', to: 'decks#add_to_deck'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
