Rails.application.routes.draw do
  get 'users/new'

  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/signup", to: "users#new"
  get "static_pages/learning"

end
