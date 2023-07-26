Rails.application.routes.draw do
  root "customers#index"
  resources :customers do
    resources :highlight_types do
      patch :move, on: :member
    end
  end
end
