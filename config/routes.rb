Rails.application.routes.draw do

  get 'building/index'
  get 'building/show'
  get 'building/new'
  get 'building/create'
  get 'controllername/building'
  get 'controllername/new'
  get 'controllername/create'
  get 'users/index'
  get 'users/show'
  resources :user
  get 'hello_world', to: 'hello_world#index'

end
