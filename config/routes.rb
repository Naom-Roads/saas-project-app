Rails.application.routes.draw do
  resources :tickets
  devise_for :users, controllers: { sessions: "users/sessions"}

  root 'home#index'
  

  # get 'action', to: 'controllerfilepath#method'


  
  
end
