Rails.application.routes.draw do
  root "events#index"
  resources :events
  resources :sessions
  resources :users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :month_calendar



end
