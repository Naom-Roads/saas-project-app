Rails.application.routes.draw do

  default_url_options :host => 'localhost:3000'


  resources :tickets do
    resources :comments, shallow: true
    # delete 'comment', to: 'comments#destroy'
  end

  devise_for :users

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  root 'home#index'
  get 'users/:id', to: 'dashboard#show', as: 'user'
  get 'users/:id', to: 'dashboard#index'
end
