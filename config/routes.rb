Rails.application.routes.draw do
  
  

  root "pages#welcome"

  get 'auth/github/callback', to: "sessions#git_create"
  get '/signup' => 'users#new', as: :signup
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/books/highest_ranked' => 'books#highest_ranked', as: :highest_ranked

  resources :books do 
    resources :reviews, except: [:show, :create, :update]
  end

  resources :reviews, only: [:create, :update]
  resources :lists

  resources :users, except: [:new, :show, :index] do
    resources :reviews, only: [:index ]
  end

  get '/dashboard' => 'users#dashboard', as: :dashboard 

  get '/users/most_reviews' => 'users#most_reviews', as: :most_reviews

  # match '*path', :to => 'application#routing_error', via: [:get, :post]

end
