Rails.application.routes.draw do
  root "home#index"

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }  do
  #   authenticated :users do
  #     root 'users#index', as: :authenticated_root
  #     buildings#index
  #   end
  resources  :goods do
    resources :good_posts, only: [:create]
  end
  resources  :tasks
  resources  :services do
    resources :service_posts, only: [:create]
  end
  devise_for :users
  resources  :profiles, only: [:show, :new, :create]
  resources  :buildings, only: [:show]
  resources  :tokens, only: [:create]
  resources  :profiles, only: [:show, :new, :create]
  resources :histories, only: [:index]
  get 'controllername/building'
  get 'controllername/new'
  get 'controllername/create'
  get 'hello_world', to: 'hello_world#index'

  get 'chats/show'

end
