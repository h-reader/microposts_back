Rails.application.routes.draw do


  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }
  end

  scope :api do
    resources :microposts, except: [:show]
    get 'user/:id/microposts', to: 'microposts#list'
  end

end
