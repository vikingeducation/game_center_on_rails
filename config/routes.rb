Rails.application.routes.draw do

  root :to => 'connect_four#new'
  resources :connect_four

end
