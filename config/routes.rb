Rails.application.routes.draw do
  resources :podcasts, only: [ :index, :show ]

  get "up" => "rails/health#show", as: :rails_health_check

  root "podcasts#index"
end
