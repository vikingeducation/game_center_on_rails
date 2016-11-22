Rails.application.routes.draw do

  get '/connectfour', to: 'connect_four_games#new'
  root 'static_pages#home'

end
