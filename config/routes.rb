Rails.application.routes.draw do
  resources :tickets
  devise_for :users, path: 'auth', controllers: { sign_in: 'login',
    sign_out: 'logout',
      confirmations: 'confirmations'
    }

  root 'home#index'
  

  # get 'action', to: 'controllerfilepath#method'


  
  
end
