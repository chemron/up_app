Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'

  # static pages
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see
  # https://guides.rubyonrails.org/routing.html
end
