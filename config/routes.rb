Rails.application.routes.draw do
  root to: "games#index"
  get "index" => "games#index"
  post "move" => "games#move"
end