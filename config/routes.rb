EmberRailsOauthExample::Application.routes.draw do
  get "/auth/:provider/callback", to: "sessions#create"

  namespace :api, defaults: { format: 'json' } do
    get "/auth/:provider/callback", to: "sessions#create"
    resources :authentications

    resources :users do
      resources :authentications
      resource :profile
    end
  end
      
  root to: 'static_pages#index'
  get '*path', to: 'static_pages#index'
end
