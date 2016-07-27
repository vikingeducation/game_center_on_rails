Rails.application.routes.draw do

  get '/gamecenter' => 'static_pages#home'

  get '/connectfour' => 'connect_four#new'

  post '/drop_piece' => 'connect_four#drop_piece'

  get '/win' => 'connect_four#win'
end
