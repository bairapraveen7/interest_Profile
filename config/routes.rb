Rails.application.routes.draw do
  get 'books/new'
  get 'movies/new'
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/addMovie', to: 'movies#new'
  get '/addBook', to: 'books#new'
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
      end 
    end 
  end 

end
