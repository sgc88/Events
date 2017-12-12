Rails.application.routes.draw do
<<<<<<< HEAD
  root "events#index"
=======
  get 'user_event/user'

  get 'user_event/event'

  root "static_images#index"
>>>>>>> 20c022cf3aef3d78ea4459a050959cd4ac79d952
  resources :events
  resources :sessions
  resources :users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :month_calendar
<<<<<<< HEAD
=======
  get '/gallery' => 'static_images#gallery', as: 'static_images_gallery'

>>>>>>> 20c022cf3aef3d78ea4459a050959cd4ac79d952



end
