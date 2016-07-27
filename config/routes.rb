Rails.application.routes.draw do
  resources :games, only: [:new, :create, :index]
  resource :game, except: [:new, :create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
