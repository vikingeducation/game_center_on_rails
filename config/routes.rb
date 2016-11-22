Rails.application.routes.draw do

  get  '/connectfour', to: 'connect_four_games#new'
  post '/connectfour', to: 'connect_four_games#update'
  root 'static_pages#home'

end
