Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  get'/dashboard', to: 'pages#dashboard'
  scope '/dashboard' do
    get '/cerfa_informations', to: 'pages#cerfa_informations'
    get '/cerfa_download', to: 'pages#download'
    get '/invoices/calculate', to: 'invoices#calculate'
    post '/invoices/calculate', to: 'invoices#calculate'
    get '/my_informations', to: 'users#informations'
    get '/personal_info', to: 'users#personal_info_users'
    get '/company_info_users', to: 'users#company_info_users'
    get '/info', to: 'users#info', as: 'toto'
    resources :invoices
    resources :taxes, only: [:index]
  end
  resources :users, only: [:update] # Pas propre car current_user donc pas besoin d'id mais choisi par Joseph pour faciliter les simple forms
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
