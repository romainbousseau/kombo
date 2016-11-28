Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :skills, only: [ :index ]
  resources :matches, only: [ :new, :create, :edit, :update, :show ]
  resources :user, only: [ :index, :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
