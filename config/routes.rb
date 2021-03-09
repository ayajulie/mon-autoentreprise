Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/info', to: 'pages#information'
  get '/invoices/calculate', to: 'invoices#calculate'

  resources :personal_info_users, only: [:edit, :create]
  resources :company_info_users, only: [:edit, :create]
  resources :invoices

  namespace :dashboard do
    resources :taxes, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
