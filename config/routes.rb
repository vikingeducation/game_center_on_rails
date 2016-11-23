Rails.application.routes.draw do

  root 'connect_four#new'

  post 'drop_piece', :to => 'connect_four#drop_piece'

end
