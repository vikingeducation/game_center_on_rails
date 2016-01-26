Rails.application.routes.draw do

  root to: 'boards#new'

  resource :board

end
