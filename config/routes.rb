Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees

  get 'pages/home'
  get 'pages/status'
  get 'pages/livemap'
  root 'pages#home'

  resources :orders, only: [:create, :new, :index]
  resources :payments, only: [:index]

  resources :products, only: [:index, :show]
  resources :zones, only: [:index, :show]
  resources :categories, only: [:index, :show]

  resources :clients, only: [:index, :show, :create, :new] do
  	resources :order, only: [:show] do
      resources :payments, only: [:show, :create, :new]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
