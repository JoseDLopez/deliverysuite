Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees, :skip => [:registrations] 
   as :employee do
    get 'employees/edit' => 'devise/registrations#edit', :as => 'edit_employee_registration'
    patch'employees/:id' => 'devise/registrations#update', :as => 'employee_registration'
  end

  get 'pages/home'
  get 'pages/status'
  get 'pages/livemap'
  root 'pages#home'
  get '/products/remove_category' => 'products#remove_category', :as => :remove_category
  post '/checknumber', to: 'orders#checknumber'

  resources :orders, only: [:create, :new, :index]
  resources :payments, only: [:index]

  resources :products
  resources :categories
  resources :zones
  

  resources :clients, only: [:index, :show, :create, :new] do
  	resources :order, only: [:show] do
      resources :payments, only: [:show, :create, :new]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
