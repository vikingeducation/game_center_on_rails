Rails.application.routes.draw do

  root to: 'pages#index'

  get 'tic_tac_toe/new' => 'tic_tac_toe#new', as: 'tic_tac_toe'
  post '/make_move' => 'tic_tac_toe#make_move'

  get 'pages/index'
  get 'pages/blackjack'
  # get 'blackjack/new'
  # get 'blackjack/hit'
  # get 'blackjack/stand'

  resources :cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
