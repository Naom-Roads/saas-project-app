Rails.application.routes.draw do
 
  default_url_options :host => "localhost:3000"

  resources :tickets
  devise_for :users, path: 'auth', controllers: { sign_in: 'login',
    sign_out: 'logout',
      confirmations: 'confirmations'
    }

  root 'home#index'
  

  # get 'action', to: 'controllerfilepath#method'


  
  
end
