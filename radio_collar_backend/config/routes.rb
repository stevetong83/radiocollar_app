RadioCollarBackend::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        #Can we do resources :registrations instead to make it easier on backbone?
        post "register", to: "registrations#create"
        post "reset_password", to: "registrations#reset_password"
        #TODO: Can I change this to 'resources :sessions'. We can block out session actions we don't need and backbone will like the format of /sessions/new and /session/destroy
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
      end
      resources :places
    end
  end

  root to: 'pages#index'

  match '/:unique_key' => 'mongoid_shortener/shortened_urls#translate', :via => :get, :constraints => { :unique_key => "~.+" }

end
