Rails.application.routes.draw do


  get 'buildings/index'
  get 'buildings/show'
  get 'buildings/new'
  get 'buildings/create'
  get 'controllername/building'
  get 'controllername/new'
  get 'controllername/create'

  
  get 'shareables/new'
  get 'shareables/create'

  get 'users/index'
  get 'users/show'
  resources :user
  get 'hello_world', to: 'hello_world#index'

end
