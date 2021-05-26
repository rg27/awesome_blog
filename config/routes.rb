Rails.application.routes.draw do
  root 'pages#home'
  # resources :pages
  get '/about', to: 'pages#about'
  get '/signup', to: 'users#new'
  resources :users
  get '/login', to: 'sessions#new'
  resources :sessions, only: :create
  delete '/logout', to: 'sessions#destroy'
end
