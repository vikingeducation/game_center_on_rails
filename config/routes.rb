Rails.application.routes.draw do

  root to: 'board#new'

  resources :board

end
