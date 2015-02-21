Rails.application.routes.draw do
  root "static_pages#index"
  get "rock_paper_scissors/new" => "rock_paper_scissors#new"
  post "rock_paper_scissors/make_move" => "rock_paper_scissors#make_move"
end
