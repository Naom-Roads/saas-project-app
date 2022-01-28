Rails.application.routes.draw do

  default_url_options :host => 'localhost:3000'

  resources :tickets
  devise_for :users

  root 'home#index'
  get 'users/:id', to: 'users#show'

end
