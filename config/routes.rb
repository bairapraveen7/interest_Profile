Rails.application.routes.draw do
  get 'movies/new'
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/addMovie', to: 'movies#new'
  get '/addSong', to: 'songs#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
   
  resources :users ,:movies,:songs, :foods

    

  resources :users do
    resources :movies do
      member do 
        post :watched,:watching,:to_watch
      end 
    end 
  end 

  resources :users do
    resources :foods do
      member do 
        post :ate,:to_eat
      end 
    end 
  end 
  
  resources :users do 
    resources :songs do 
      member do 
        post :liked
      end 
    end 
  end 

end
