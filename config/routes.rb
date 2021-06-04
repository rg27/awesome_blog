Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/signup', to: 'users#new'
  resources :users
  root 'users#homefeed'
  resources :posts, only: [:create, :destroy]
  get '/login', to: 'sessions#new'
  resources :sessions, only: :create
  delete '/logout', to: 'sessions#destroy'
  resources :relationships, only:[:create, :destroy]
end
