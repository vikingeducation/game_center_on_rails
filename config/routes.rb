Rails.application.routes.draw do
  root to: 'index'
  resources :board
end
