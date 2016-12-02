Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :index, :show, :dashboard]do
    get 'dashboard', to: 'users#dashboard'
    get 'add_skill', to: 'users#add_skill'
  end
  root to: 'pages#home'
  resources :skills, only: [ :index ]
  resources :matches, only: [ :new, :create, :edit, :update, :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  # get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'
end
