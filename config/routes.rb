Rails.application.routes.draw do
  get 'user_event/user'

  get 'user_event/event'

  root "static_images#index"
  resources :events
  resources :sessions
  resources :users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :month_calendar
  get '/gallery' => 'static_images#gallery', as: 'static_images_gallery'




end
