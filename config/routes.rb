Rails.application.routes.draw do
  root to: 'game#index'

  get '/game',        to: 'game#edit'
  get '/drop_piece',  to: 'game#update'
  get '/results',     to: 'game#show'

  get 'game/create'
  get 'game/destroy'
end
