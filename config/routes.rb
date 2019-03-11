Rails.application.routes.draw do


  devise_for :users
  resources :profiles, only: [:show, :new, :create]
  resources :buildings, only: [:index, :show, :new, :create]
  resources :tokens, only: [:create]
  get 'controllername/building'
  get 'controllername/new'
  get 'controllername/create'
  get 'shareables/new'
  get 'shareables/create'
  get 'hello_world', to: 'hello_world#index'
  root 'home#index'

  get 'chats/show'

end
