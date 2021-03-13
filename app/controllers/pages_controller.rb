class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
  end

  def fill
    @user = current_user
    @file_name = "/tmp/2021_User.pdf"
    pdftk_path = ENV['PDFTK_PATH']
    pdf_name = '/public/asset/cerfa.pdf'
    # prenom = CGI.unescapeHTML('Pr&#233;noms')
    pdftk = PdfForms.new(pdftk_path)
    data = { 'NOM DE NAISSANCE' => @user.birth_last_name,
             'ENTREPRENEUR INDIVIDUEL (EI)' => 'On',
             'Nom dusage' => @user.use_name,
             CGI.unescapeHTML('Pr&#233;noms') => @user.first_name,
             'M' => @user.gender == 'M' ? 'On' : 'Off',
             'Pseudonyme' => @user.pseudonym,
             CGI.unescapeHTML('Nationalit&#233;') => @user.citizenship,
             CGI.unescapeHTML('N&#233;e le') => @user.birth_date,
             CGI.unescapeHTML('D&#233;pt') => @user.birth_department,
             'Commune' => @user.birth_city,
             'Pays' => @user.birth_country,
             CGI.unescapeHTML('Domicile  r&#233;s b&#226;t n voie lieudit 1') => @user.address,
             'Code postal' => @user.zipcode,
             'Commune_2' => @user.city,
             'Pays_2' => @user.country,
             'non_1' => @user.spouse_working_in_company == true ? 'On' : 'Off',
             'non_2' => @user.spouse_working_in_company == true ? 'Off' : 'On',
             CGI.unescapeHTML('RENONCIATION &#224; linsaisissabilit&#233; de droit de la r&#') => 'On' }

    pdftk.fill_form pdf_name, @file_name, data
    # type: "application/pdf"
  end

  def download
    send_file "/tmp/2021_User.pdf"
  end
end
