Rails.application.routes.draw do
  
  get 'users/edit'
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get 'users/:id' =>  'users#show'
  # get 'users/new'
  # get 'users/show'
  
  resources :sessions
  post 'sessions' => 'users#create'
  post 'sessions/logout'
end
