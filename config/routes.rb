Rails.application.routes.draw do
  root to: "boards#index"
  resource :board
end
