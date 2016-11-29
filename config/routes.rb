Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [ :index, :show ]
  root to: 'pages#home'
  resources :skills, only: [ :index ]
  resources :matches, only: [ :new, :create, :edit, :update, :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
