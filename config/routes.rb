Rails.application.routes.draw do

  root 'static_pages#home'
  # static pages
  get '/home', to: 'static_pages#home'

  # users
  get '/signup', to: 'users#new'
  get '/accounts', to: 'users#accounts'
  resource :user
  # sessions
  get '/login',   to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
