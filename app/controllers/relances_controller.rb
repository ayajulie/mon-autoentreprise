class RelancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
  end

  def services
    @user = current_user
  end

  def relance
    respond_to do |format|
    format.docx do
      render docx: 'relance.docx.erb', filename: 'my_file.docx'
      # Alternatively, if you don't want to create the .docx.erb template you could
    end
  end
  end

  def download
    @user = current_user
    cerfa_informations
    send_file "/tmp/2021_User.pdf"
  end
end


