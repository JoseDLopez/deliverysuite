Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees

  get 'pages/home'

  get 'pages/status'

  get 'pages/livemap'

  root 'pages#home'

  resources :products, only: [:index, :show]
  resources :zones, only: [:index, :show]
  resources :categories, only: [:index, :show]

  resources :clients, only: [:index, :show, :create] do
  	resources :order, only: [:index, :show, :create] do
      resources :payments, only: [:index, :show, :create]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
