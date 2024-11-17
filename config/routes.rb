Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :podcasts, only: [:index, :show]
  resources :episodes, only: [:show]

  get "up" => "rails/health#show", as: :rails_health_check

  root "podcasts#index"
end
