Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }  do
    authenticated :users do
      root 'users#index', as: :authenticated_root
    end

    unauthenticated do
      root 'new_user_registration#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:show]

  
  resources :buildings, only: [:index, :show, :new, :create]
  resources :tokens, only: [:create]
  get 'controllername/building'
  get 'controllername/new'
  get 'controllername/create'
  get 'shareables/new'
  get 'shareables/create'
  get 'hello_world', to: 'hello_world#index'

  get 'chats/show'

end
