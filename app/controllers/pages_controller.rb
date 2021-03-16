class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
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
             CGI.unescapeHTML('N&#233;e le') => "#{@user.birth_date[8..9]}#{@user.birth_date[5..6]}#{@user.birth_date[0..3]}",
             CGI.unescapeHTML('D&#233;pt') => @user.birth_department,
             'Commune' => @user.birth_city,
             'Pays' => @user.birth_country,
             CGI.unescapeHTML('Domicile  r&#233;s b&#226;t n voie lieudit 1') => @user.address,
             'Code postal' => @user.zipcode,
             'Commune_2' => @user.city,
             'Pays_2' => @user.country,
             'non_1' => @user.spouse_working_in_company == true ? 'On' : 'Off',
             'non_2' => @user.spouse_working_in_company == true ? 'Off' : 'On',
             CGI.unescapeHTML('RENONCIATION &#224; linsaisissabilit&#233; de droit de la r&#') => 'On',
             'VOTRE N DE SECURITE SOCIALE' => @user.ssn,
             'trimestrielle' => 'On',
             'oui_6' => @user.bic_status,
             'OBSERVATIONS' => @user.remarks,
             'ADRESSE de correspondance' => @user.address,
             'Code postal_5' => @user.zipcode,
             'Commune_8' => @user.city,
             'DATE DE DEBUT DACTIVITE' => "#{@user.start_activity[8..9]}#{@user.start_activity[5..6]}#{@user.start_activity[0..3]}",
             'Permanente' => 'On',
             CGI.unescapeHTML('RENONCIATION &#224; linsaisissabilit&#233; de droit de la r&#') => 'On',
             CGI.unescapeHTML('Etablissement o&#249; vous exercez votre activit&#233') => 'On',
             CGI.unescapeHTML('ADRESSE DE LETABLISSEMENT r&#233;s b&#226;t app &#233;tage n voie lieudit 2') => @user.company_address,
             'Code postal_2' => @user.company_zipcode,
             'Code Commune_3' => @user.company_city }

    pdftk.fill_form pdf_name, @file_name, data
  end

  def download
    @user = current_user
    send_file "/tmp/2021_User.pdf"
  end
end
