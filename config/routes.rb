Rails.application.routes.draw do

  default_url_options :host => 'localhost:3000'

  resources :tickets

  devise_for :users

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  root 'home#index'
  get 'users/:id', to: 'dashboard#show', as: 'user'
  get 'users/:id', to: 'dashboard#index'

  get 'comments', to: 'comments#index'
  get 'comment', to: 'comments#show'
  post 'comment', to: 'comments#create'

end
