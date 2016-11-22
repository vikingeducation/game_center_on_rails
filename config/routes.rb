Rails.application.routes.draw do
  root :to => 'connect_four#new'
  post "/drop_piece" => 
  resources :connect_four
end
