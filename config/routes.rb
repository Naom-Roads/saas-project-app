Rails.application.routes.draw do

  default_url_options :host => 'localhost:3000'

  resources :tickets
  devise_for :users, controllers: { sessions: "users/sessions"}

  root 'home#index'
  

  # get 'action', to: 'controllerfilepath#method'


  
  
end
