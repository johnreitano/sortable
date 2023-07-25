Rails.application.routes.draw do
  root "customers#index"
  resources :customers do
    resources :highlight_types
  end
end
