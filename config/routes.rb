Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_out',
        to: 'devise/sessions#destroy',
        as: :destroy_user_session
  end
  resources :orders, only: [:new, :create, :show]
  namespace :wamui do
    resources :subscribers
    resources :users, only: :index
    root to: "subscribers#index"
  end
  root to: "orders#new"
end
