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
    pdftk = PdfForms.new(pdftk_path)
    data = { 'NOM DE NAISSANCE' => @user.birth_last_name,
             'ENTREPRENEUR INDIVIDUEL (EI)' => 'On',
             'Nom dusage' => @user.use_name,
             'Pr&#233;noms' => @user.first_name,
             'M' => @user.gender == 'M' ? 'On' : 'Off' }
    pdftk.fill_form pdf_name, @file_name, data
  end

  def download
    @user = current_user
    send_file "/tmp/2021_User.pdf"
  end
end
