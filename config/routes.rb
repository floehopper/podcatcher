Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :podcasts, only: [ :index, :show ] do
    resources :subscriptions, only: :create
  end
  resources :episodes, only: [ :show, :index ] do
    member do
      get :load_position
      post :save_position
    end
  end
  resources :subscriptions, only: [ :index, :destroy ]

  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
