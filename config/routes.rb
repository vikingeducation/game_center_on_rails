Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :rps
  get '/rockpaperscissors', :to => 'rps#new'
  post '/rockpaperscissors/move' => 'rps#move'
end
