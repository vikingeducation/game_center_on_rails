Rails.application.routes.draw do

  # get 'blackjack/new'

  # get 'blackjack/hit'

  # get 'blackjack/stand'

  root to: 'pages#index'

  get 'pages/index'
  get 'pages/blackjack'

  resources :cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
