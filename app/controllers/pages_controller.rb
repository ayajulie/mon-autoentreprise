class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
  end

  def services
    @user = current_user
  end

  def cerfa_informations
    @user = current_user
    # @file_name = Tempfile.new("/tmp/2021_User.pdf")
    @file_name = "/tmp/2021_User.pdf"
    pdftk_path = ENV['PDFTK_PATH']
    pdf_name = '/public/asset/cerfa.pdf'
    # prenom = CGI.unescapeHTML('Pr&#233;noms')
    pdftk = PdfForms.new(pdftk_path)
    @data = { 'non' => 'On',
              'NOM DE NAISSANCE' => @user.birth_last_name,
              'ENTREPRENEUR INDIVIDUEL (EI)' => 'On',
              'Nom dusage' => @user.use_name,
              CGI.unescapeHTML('Pr&#233;noms') => @user.first_name,
              'M' => @user.gender == 'M' ? 'On' : 'Off',
              'M' => @user.gender == 'F' ? 'On' : 'Off',
              'Pseudonyme' => @user.pseudonym,
              CGI.unescapeHTML('Nationalit&#233;') => 'France',
              CGI.unescapeHTML('N&#233;e le') => @user.birth_date,
              CGI.unescapeHTML('D&#233;pt') => @user.birth_department,
              'Commune' => @user.birth_city,
              'Pays' => 'France',
              CGI.unescapeHTML('Domicile  r&#233;s b&#226;t n voie lieudit 1') => @user.address,
              'Code postal' => @user.zipcode,
              'Commune_2' => @user.city,
              'Pays_2' => 'France',
              'non_1' => @user.spouse_working_in_company == true ? 'On' : 'Off',
              'non_2' => @user.spouse_working_in_company == true ? 'Off' : 'On',
              CGI.unescapeHTML('RENONCIATION &#224; linsaisissabilit&#233; de droit de la r&#233;sidence principale publi&#233;e au service de') => 'On',
              'VOTRE N DE SECURITE SOCIALE' => @user.ssn[0..12],
              'VOTRE N DE SECURITE SOCIALE_1' => @user.ssn[13..14],
              'trimestrielle' => 'On',
              'oui_6' => @user.bic_status,
              'OBSERVATIONS' => @user.remarks,
              'ADRESSE de correspondance' => @user.address,
              'Code postal_5' => @user.zipcode,
              'Commune_8' => @user.city,
              'DATE DE DEBUT DACTIVITE' => @user.start_activity,
              'Permanente' => 'On',
              CGI.unescapeHTML('Etablissement o&#249; vous exercez votre activit&#233;') => 'On',
              CGI.unescapeHTML('ADRESSE DE LETABLISSEMENT r&#233;s b&#226;t app &#233;tage n voie lieudit 2') => @user.establishment_address,
              CGI.unescapeHTML('Cr&#233;ation passer directement au cadre suivant') => 'On',
              'Code postal_2' => @user.company_zipcode,
              'Commune_3' => @user.company_city,
              CGI.unescapeHTML('Activit&#233; principale') => @user.main_activity_freetext,
              CGI.unescapeHTML('Autre pr&#233;ciser') => "On",
              CGI.unescapeHTML('Autre, pr&#233;ciser') => @user.main_activity_freetext,
              'NOM COMMERCIAL  NOM PROFESSIONNEL' => @user.company_name,
              'ENSEIGNE' => @user.company_name,
              'non_6' => "On",
              'non_7' => "On",
              'non_4' => 'On',
              'non_8' => 'On',
              CGI.unescapeHTML('T&#233;l') => @user.phone_number,
              CGI.unescapeHTML('T&#233;l&#233;copie  courriel') => @user.email,
              CGI.unescapeHTML('LE DECLARANT D&#233;sign&#233; au cadre 3') => 'On',
              CGI.unescapeHTML('Fait &#224;') => @user.city,
              'Le' => Time.now.strftime('%d%m%Y') }

    pdftk.fill_form pdf_name, @file_name, @data
  end

  def download
    @user = current_user
    cerfa_informations
    send_file "/tmp/2021_User.pdf"
  end
end
