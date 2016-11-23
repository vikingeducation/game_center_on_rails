Rails.application.routes.draw do
  root to: 'game#index'

  get '/game',         to: 'game#edit'
  post '/game',        to: 'game#edit'
  patch '/drop_piece', to: 'game#update'
  get '/drop_piece',   to: 'game#update'
  get '/results',      to: 'game#show'
  get '/new',          to: 'game#new'

  get 'game/destroy'
end
