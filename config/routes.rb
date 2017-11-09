Rails.application.routes.draw do

  root to: 'pages#index'
  get 'pages/index'

  get 'tic_tac_toe/new' => 'tic_tac_toe#new', as: 'tic_tac_toe'
  post '/tic_tac_toe/make_move' => 'tic_tac_toe#make_move', as: 'tic_tac_toe_move'

  get 'hi_lo/new' => 'hi_lo#new', as: 'hi_lo'
  post '/hi_lo/make_move' => 'hi_lo#make_move', as: 'hi_lo_move'

  get 'blackjack/new' => 'blackjack#new', as: 'blackjack'
  post '/blackjack/hit' => 'blackjack#hit', as: 'blackjack_hit'
  post '/blackjack/stand' => 'blackjack#stand', as: 'blackjack_stand'

  resources :cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
