Rails.application.routes.draw do
  get 'movies/new'
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/addMovie', to: 'movies#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/movies/:user_id', to: 'movies#index', as: 'all_movies'
  resources :users
  resources :movies

  resources :movies do 
      member do 
        get :user
      end 
  end 

  resources :users do
    resources :movies do
      member do 
        post :watched,:watching,:to_watch,:change_rating,:change_notes
      end 
    end 
  end 

end
