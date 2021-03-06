Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/info', to: 'pages#information'
  get'/dashboard', to: 'pages#dashboard'
  get '/fill', to: 'pages#fill'
  get '/download', to: 'pages#download'

  resources :personal_info_users, only: [:edit, :create]
  resources :company_info_users, only: [:edit, :create]

  namespace :dashboard do
    resources :invoices
    resources :taxes, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
