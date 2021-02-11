Rails.application.routes.draw do
  get "welcome/:first_name", to: "static#welcome"
  get "team", to: "static#team"
  get "contact", to: "static#contact"
  get "/welcome", to: "static#welcome"

  resources :gossips
  resources :users
  resources :cities
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
end
