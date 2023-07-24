Rails.application.routes.draw do
  root "customers#index"
  resources :customers do
    resources :highlights
  end
end
