Rails.application.routes.draw do
  
  get '/users/new', to: 'users#new', as: 'new_user'
  root 'static#home'

  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  resources :rides
  resources :users
  resources :attractions
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
