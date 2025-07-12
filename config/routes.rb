Rails.application.routes.draw do

  # Defines the root path route ("/")
  # root "posts#index"

  get '/home', to: 'pages#home'
  get "/about", to: 'pages#about'
  root "pages#home"
end
