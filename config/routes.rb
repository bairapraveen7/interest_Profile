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
  delete '/relationship/:id', to: 'relationships#destroy', as: :relationship
   
  resources :users ,:movies, :books, :foods,:songs

  resources :relationships, only: [:create]

  resources :users do 
    member do 
      get :feed,:following,:followers
    end 
  end 

  resources :users do
    resources :movies do
      member do 
        post :watched,:watching,:to_watch
      end 

      resources :comments do 
      end 
      
    end 
  end 

  resources :users do
    resources :books do
      member do 
        post :read,:reading,:to_read
      end 

      resources :comments do 
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

      resources :comments do 
      end 

    end 
  end 

   

end
