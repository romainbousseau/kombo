Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :index, :show, :dashboard, :edit] do
    get 'update_profile', to: 'users#update_profile'
    get 'dashboard', to: 'users#dashboard'
    get 'add_skill', to: 'users#add_skill'
  end
  root to: 'pages#home'
  resources :skills, only: [ :index ]
  resources :work_sessions, only: [ :new, :edit, :update, :show, :create ] do
    resources :reviews, only: [:new, :create]
    member do
      post 'validate'
      post 'decline'
      post 'done'
    end
    resources :messages, only: [:new, :create, :show]
  end


end
