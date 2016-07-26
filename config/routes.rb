Rails.application.routes.draw do
  
  get '/gamecenter' => 'static_pages#home' 

  get '/connectfour' => 'connect_four#new'

end
