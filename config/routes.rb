Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees

  get 'pages/home'

  get 'pages/status'

  get 'pages/livemap'

  root 'pages#home'

  resources :products, only: [:index, :show]

  resources :clients, only: [:index, :show] do
  	resources :order, only: [:index, :show, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
