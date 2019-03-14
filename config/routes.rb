Rails.application.routes.draw do
  root "buildings#index"
    devise_for :users

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }  do
  #   authenticated :users do
  #     root 'users#index', as: :authenticated_root
  #   end
  resources :goods
  resources :tasks
  resources :services
  devise_for :users
  resources :profiles, only: [:show, :new, :create]
  resources :buildings, only: [:index, :show, :new, :create]
  resources :tokens, only: [:create]
  resources :profiles, only: [:show, :new, :create]
  get 'controllername/building'
  get 'controllername/new'
  get 'controllername/create'
  get 'shareables/new'
  get 'shareables/create'
  get 'hello_world', to: 'hello_world#index'

  get 'chats/show'

end
