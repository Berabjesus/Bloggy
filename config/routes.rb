Rails.application.routes.draw do
  get 'sessions/new'
  # get 'users/new'
  post 'login', to: 'sessions#create'
  post 'guest', to: 'sessions#guest'
  resources :sessions, only: [:destroy]
  resources :users
  resources :blogs do
    resources :comments
  end
  root to: 'blogs#index'
end
