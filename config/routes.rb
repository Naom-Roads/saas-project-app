Rails.application.routes.draw do
  resources :tickets
  devise_for :users, controllers: { sessions: "users/sessions"}

  root 'home#index'


  # get 'sign_in', to: 'users/sessions#new'
  # delete 'sign_out', to: 'users/sessions#destroy'

  
  
end
