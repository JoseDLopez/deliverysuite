Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees

  get 'pages/home'

  get 'pages/status'

  get 'pages/livemap'

  get 'orders/create'
  get 'orders/index'

  get 'payments/index'

  root 'pages#home'

  resources :products, only: [:index, :show]
  resources :zones, only: [:index, :show]
  resources :categories, only: [:index, :show]

  resources :clients, only: [:index, :show, :create] do
  	resources :order, only: [:show] do
      resources :payments, only: [:show, :create]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
