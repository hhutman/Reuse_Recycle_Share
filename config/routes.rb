Rails.application.routes.draw do

  devise_for :users
  resources :profiles, only: [:show, :new, :create]
  resources :buildings, only: [:index, :show, :new, :create]
  get 'controllername/building'
  get 'controllername/new'
  get 'controllername/create'
<<<<<<< HEAD


=======
>>>>>>> d80f3dae1fc5468ad3b464c3861e6a048d69b961
  get 'shareables/new'
  get 'shareables/create'
  get 'hello_world', to: 'hello_world#index'
  root 'home#index'

end
