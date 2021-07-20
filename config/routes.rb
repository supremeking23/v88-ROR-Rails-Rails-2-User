Rails.application.routes.draw do
  
 
  get 'likes/destroy'
  get 'secrets' => "secrets#index"
  get 'users/:id/edit' =>"users#edit"
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  get 'users/:id' =>  'users#show'
  post 'users/create'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  # get 'users/new'
  # get 'users/show'
  
  resources :sessions
  post 'sessions' => 'users#create'
  post 'sessions/logout'
  post 'secrets' => 'secrets#create'
  delete 'secrets' => 'secrets#destroy'


  post 'likes' => 'likes#create'
  patch 'likes' => 'likes#update'
end
