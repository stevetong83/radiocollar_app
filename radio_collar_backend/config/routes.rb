RadioCollarBackend::Application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'sessions', to: 'sessions#create', as: 'login'
        delete 'sessions', to: 'sessions#destroy', as: 'logout'
        post 'registrations', to: 'registrations#create', as: 'register'
      end
      resources :places
    end
  end
end
