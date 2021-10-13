Rails.application.routes.draw do
  get '/actualites',  to: 'pages#actualites'
  devise_for :users
  devise_scope :user do
   get '/users/sign_out', to: 'devise/sessions#destroy'
end
  root to: 'pages#home'


  get'/dashboard', to: 'pages#dashboard'
  scope '/dashboard' do
    get '/cerfa_informations', to: 'pages#cerfa_informations'
    get '/cerfa_download', to: 'pages#download'
<<<<<<< HEAD
    get '/invoices/:id/calculate', to: 'invoices#calculate'
    post '/invoices/:id/calculate', to: 'invoices#calculate'
=======
    get '/invoices/:id/calculate', to: 'invoices#calculate', as: :invoices_calculate
    post '/invoices/calculate', to: 'invoices#calculate'
>>>>>>> f9cbba738f684312612d3aae8756807a9d8dd46f
    get '/my_informations', to: 'users#informations'
    get '/company_registration',  to: 'users#company_registration'
    get '/services',  to: 'pages#services'
    get '/demarches',  to: 'users#demarches'
<<<<<<< HEAD
<<<<<<< HEAD
    get '/comptabilites/:id:/calculate', to: 'comptabilites#calculate'
    post '/comptabilites/:id/calculate', to: 'comptabilites#calculate'
=======
=======

    get '/comptabilites/:id/calculate', to: 'comptabilites#calculate', as: :comptabilites_calculate
    post '/comptabilites/:id/calculate', to: 'comptabilites#calculate'

>>>>>>> f9cbba738f684312612d3aae8756807a9d8dd46f
    get '/relances', to: 'relances#lettre', :defaults => { :format => 'docx' }

>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91

    # get '/personal_info', to: 'users#personal_info_users'
    # get '/company_info', to: 'users#company_info_users'
    resources :invoices
    resources :taxes, only: [:index]
<<<<<<< HEAD
<<<<<<< HEAD
    resources :comptabilites
    resources :devis
=======
    resources :devis
    resources :relances
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
=======


    resources :devis
    resources :relances

>>>>>>> f9cbba738f684312612d3aae8756807a9d8dd46f
  end
  resources :users, only: [:update] # Pas propre car current_user donc pas besoin d'id mais choisi par Joseph pour faciliter les simple forms
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
