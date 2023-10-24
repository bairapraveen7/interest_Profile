Rails.application.routes.draw do
  get 'movies/new'
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/addMovie', to: 'movies#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
   
  resources :users ,:movies

    

  resources :users do
    resources :movies do
      member do 
        post :watched,:watching,:to_watch,:change_rating,:change_notes
      end 
    end 
  end 

end
