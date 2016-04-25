Rails.application.routes.draw do
  resources :orders, only: [:new, :create, :show]
  namespace :wamui do
    resources :subscribers
    root to: "subscribers#index"
  end
  root to: "orders#new"
end
