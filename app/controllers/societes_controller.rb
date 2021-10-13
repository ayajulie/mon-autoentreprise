class SocietesController < ApplicationController

  def new
    @societe = Societe.new
  end

  def create
    @societe = Societe.new(societe_params)
    @relance.user_id = current_user
    if @societe.save
        redirect_to societe_path(@societe)
    else
        render "new"
    end
  end

  def show
    @societe = Societe.find(params[:id])
    respond_to do |format|
    format.docx do
      render docx: 'sas.docx.erb', filename: 'statut.docx'
  end

  private

  def societe_params
      params.require(:societe).permit(:denomination_sociale, :creance, :creance_at, :user_id)
  end
end
