Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'games#index'
  resources :games, only: [:index, :new, :create, :show, :update]
  match '/winner' => 'games#winner', :via => :get
end
