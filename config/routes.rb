Myflix::Application.routes.draw do
  root to: 'pages#front_page'
  get '/home', to: 'videos#index'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :videos, only: [:show] do
    collection do
      get 'search'
    end
  end
  resources :categories, only: [:show]
  resources :users, only: [:create]


  get 'ui(/:action)', controller: 'ui'
end
