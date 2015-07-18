Rails.application.routes.draw do
  root to: "games#new"
  get "index" => "games#index"
  post "move" => "games#move"
  get "new" => "games#new"
end