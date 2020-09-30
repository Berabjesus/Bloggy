Rails.application.routes.draw do
  get 'sessions/new'
  # get 'users/new'
  post 'login', to: 'sessions#create'
  resources :sessions, only: [:destroy]
  resources :users
  resources :blogs do
    resources :comments
  end
  root to: 'blogs#index'
end
