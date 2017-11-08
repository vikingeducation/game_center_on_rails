Rails.application.routes.draw do

  root to: 'pages#index'

  get 'tic_tac_toe/new' => 'tic_tac_toe#new', as: 'tic_tac_toe'
  post '/tic_tac_toe/make_move' => 'tic_tac_toe#make_move', as: 'tic_tac_toe_move'

  get 'hi_lo/new' => 'hi_lo#new', as: 'hi_lo'
  post '/hi_lo/make_move' => 'hi_lo#make_move', as: 'hi_lo_move'

  get 'pages/index'
  get 'pages/blackjack'
  # get 'blackjack/new'
  # get 'blackjack/hit'
  # get 'blackjack/stand'

  resources :cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
