Rails.application.routes.draw do
  resources :orders, only: [:new]
  root to: "orders#new"
end
