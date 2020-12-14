Rails.application.routes.draw do
  namespace :api do
    resources :certificates_sources, only: [:create]
  end
end
