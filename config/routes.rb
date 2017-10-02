Myflix::Application.routes.draw do
  root 'sessions#front'

  get '/register', to: 'users#new', as: 'register'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  get '/home', to: 'videos#index'

  resources :videos, only: [:show] do
    collection do
      get '/search', to: 'videos#search'
    end
  end
  resources :categories, only: [:show]
  resources :users, only: [:create]

  get 'ui(/:action)', controller: 'ui'
end
