class SocietesController < ApplicationController

  def new
    @societe = Societe.new
  end

  def create
  end

  def show
    @societe = Societe.find(params[:id])
    respond_to do |format|
    format.docx do
      render docx: 'sas.docx.erb', filename: 'statut.docx'
  end
end
