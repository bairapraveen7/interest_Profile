Rails.application.routes.draw do
  get 'books/new'
  get 'comments/new'
  get 'comments/create'
  get 'movies/new'
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/addMovie', to: 'movies#new'
  get '/addBook', to: 'books#new'
  get '/addSong', to: 'songs#new'
  get '/addSong', to: 'songs#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
   
  resources :users ,:movies, :books

    

  resources :users do
    resources :movies do
      member do 
        post :watched,:watching,:to_watch
      end 
    end 
  end 

  resources :users do
    resources :books do
      member do 
        post :read,:reading,:to_read
        post :watched,:watching,:to_watch
      end 
    end 
  end 

  resources :users do
    resources :foods do
      member do 
        post :ate,:to_eat
      end 
      
      resources :comments do 
      end 
     
    end 
  end 
  
  resources :users do 
    resources :songs do 
      member do 
        post :liked
      end 
      
      resources :comments do 
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
