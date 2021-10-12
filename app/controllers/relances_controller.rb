class RelancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
  end

  def new
    @relance = Relance.new
  end

  def create
    @relance = Relance.new()
    if @relance.save
        redirect_to relances_path
    else
        render "new"
    end
  end

  respond_to :docx

  def lettre
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

  private

  def relance_params
     params.require(:relance).permit(:name, :creance, :creance_at, :user_id, :client_id)
  end
end


