Rails.application.routes.draw do

  resources :microposts

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }


  end

end
