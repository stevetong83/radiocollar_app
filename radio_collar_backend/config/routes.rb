RadioCollarBackend::Application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  scope "api_v1" do
    resources :places
  end

end
