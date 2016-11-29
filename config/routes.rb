Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :skills, only: [ :index ]
  resources :matches, only: [ :new, :create, :edit, :update, :show ]
  resources :users, only: [ :index, :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  # get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'
end
