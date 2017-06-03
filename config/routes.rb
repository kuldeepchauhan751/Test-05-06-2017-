Rails.application.routes.draw do
  
  #get 'reset_password/new'

  #get 'reset_password/create'

  #get 'reset_password/edit'

  #get 'reset_password/update'

  get 'friendships/create'
  get 'friendships/destroy'

  #get 'sessions/index'

  #get 'sessions/new'

  #get 'sessions/show'

  #get 'sessions/create'
 #get 'sessions/destroy'
  

 root 'sessions#new'
 resources :messages
 resources :users
 get 'login' =>'sessions#new' 
  resources :sessions 
  get 'logout'=>'sessions#destroy'
  resources :reset_password
#get '/sessions/new', to: 'sessions#new'
#post '/sessions/new', to: 'sessions#new'

 # get 'users/index'

 # get 'users/index'

  #get 'users/show'

 # get 'users/create'

  #get 'users/destroy'

  
end
