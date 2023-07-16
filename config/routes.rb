Rails.application.routes.draw do
  get 'static_pages/about'
  get 'static_pages/how_to_channel'
  get 'static_pages/contact'
  get 'static_pages/approval_request'
  get 'requests/new'
  root 'boards#index'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get '/signup',     to: 'users#new'
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  get '/requests',   to: 'requests#show'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :boards do
    resources :game_recruitments, only: [:new, :create, :show] do
      resources :requests, only: [:new, :create, :show, :update, :destroy]
    end
    resources :comments, only: [:new, :create, :show]
  end
end
