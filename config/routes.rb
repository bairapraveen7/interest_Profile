Rails.application.routes.draw do
  get 'movies/new'
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :movies

  resources :users do
    member do 
      get :movies
    end 
  end

  resources :users do
    resources :movies do
      member do 
        post :watched,:watching,:to_watch
      end 
    end 
  end 

end
