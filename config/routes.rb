Rails.application.routes.draw do
  
  get 'shareables/new'
  get 'shareables/create'
  get 'users/index'
  get 'users/show'
  resources :user
  get 'hello_world', to: 'hello_world#index'
  
end
