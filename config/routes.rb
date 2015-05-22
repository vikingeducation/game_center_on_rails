Rails.application.routes.draw do
  root to: 'static_pages#home'

  resources :rps, :only => [:new]
  get '/rockpaperscissors', :to => 'rps#new'
  post '/rockpaperscissors/move' => 'rps#move'

  resources :connectfour, :only => [:new]
  get '/connectfour', :to => 'connectfour#new'
  post '/connectfour/drop_piece' => 'connectfour#drop_piece'
end
