Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :podcasts, only: [:index, :show] do
    resources :subscriptions, only: :create
  end
  resources :episodes, only: [:show]
  resources :subscriptions, only: [:destroy]

  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
