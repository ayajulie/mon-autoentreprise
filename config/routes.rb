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




    get '/invoices/:id/calculate/', to: 'invoices#calculate', as: :invoices_calculate
    post '/invoices/calculate', to: 'invoices#calculate'

    get '/my_informations', to: 'users#informations'
    get '/company_registration',  to: 'users#company_registration'
    get '/services',  to: 'pages#services'
    get '/demarches',  to: 'users#demarches'
    get '/relances/:id', to: 'relances#show', :defaults => { :format => 'docx' }
    get '/relance/new', to: 'relances#new'

    get '/miseendemeure/:id', to: 'miseendemeures#show', :defaults => { :format => 'docx' }, as: :miseendemeure_show

    get '/comptabilites/:id', to: 'comptabilites#show_calculate', :defaults => { :format => 'docx' }, as: :show_calculate

    get '/comptabilite/new', to: 'comptabilites#new', as: :new_comptabilite


    get '/comptabilites/:id/calculate/', to: 'comptabilites#calculate', as: :comptabilites_calculate
    post '/comptabilites/:id/calculate', to: 'comptabilites#calculate'

    get '/relances', to: 'relances#lettre', :defaults => { :format => 'docx' }


  get '/devis/:id/show/', to: 'devis#show', as: :devi_show

  get '/devis/search', to: 'devis#search', as: :devi_search

   get '/devis/resultat', to: 'devis#resultat', as: :resultat_devi



    # get '/personal_info', to: 'users#personal_info_users'
    # get '/company_info', to: 'users#company_info_users'
    resources :invoices
    resources :taxes, only: [:index]


    resources :comptabilites

    resources :devis
    resources :relances
    resources :miseendemeures, only: [:new, :create]
    resources :achats
    resources :clients

  end

  resources :users, only: [:update] # Pas propre car current_user donc pas besoin d'id mais choisi par Joseph pour faciliter les simple forms
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
