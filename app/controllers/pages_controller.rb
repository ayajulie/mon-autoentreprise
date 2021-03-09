class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
  end

  def fill
    @file_name = "/tmp/2021_User.pdf"
    pdftk_path = ENV['PDFTK_PATH']
    pdf_name = '/public/asset/cerfa.pdf'
    pdftk = PdfForms.new(pdftk_path)
    data = { 'NOM DE NAISSANCE' => 'KOFFI',
             'ENTREPRENEUR INDIVIDUEL (EI)' => 'On' }
    pdftk.fill_form pdf_name, @file_name, data
    # type: "application/pdf"
  end

  def download
    send_file "/tmp/2021_User.pdf"
  end
end
