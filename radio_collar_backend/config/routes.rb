RadioCollarBackend::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post "register", to: "registrations#create"
        post "reset_password", to: "registrations#reset_password"
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
      end
      resources :places
    end
  end

  root to: 'pages#index'
end
