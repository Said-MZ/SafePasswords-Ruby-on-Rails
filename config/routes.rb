Rails.application.routes.draw do
  devise_for :users, path: "secure"

  # Defines the root path route ("/")
  # root "posts#index"

  get "/home", to: "pages#home"
  get "/about", to: "pages#about"

  resources :entries

  root "entries#index"
end
