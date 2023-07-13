Rails.application.routes.draw do
  get 'game_recruitments/new'
  get 'comments/new'
  root 'boards#index'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get '/signup',     to: 'users#new'
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :boards do
    resources :comments, only: [:new, :create, :show]
    resources :game_recruitments, only: [:new, :create, :show]
  end
end
