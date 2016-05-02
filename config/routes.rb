Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :orders, only: [:new, :create, :show]
  namespace :wamui do
    resources :subscribers
    root to: "subscribers#index"
  end
  root to: "orders#new"
end
