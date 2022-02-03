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

  get 'comments', to: 'comments#show' #should this be show or index? Intended behavior is that they reply on a ticket comment thread
  post 'comment', to: 'comments#create'

end
