Rails.application.routes.draw do
  get '/home' => 'game#home'

  get '/end' => 'game#end'

  post '/play' => 'game#play'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
