Rails.application.routes.draw do

  default_url_options :host => 'localhost:3000'

  resources :tickets
  devise_for :users

  root 'home#index'
  get 'user', to: 'user#show'
  # get 'action', to: 'controllerfilepath#method'


  
  
end
