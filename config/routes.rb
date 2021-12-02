Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #manual route/ custom Route

  # HTTP VERB path to: name of controller#name of method in controller
  # get '/users', to: 'users#index'

  resources :users do 
    resources :chirps, only:[:index]
  end 
 
  # resources :chirps, only:[:index]
 
end
