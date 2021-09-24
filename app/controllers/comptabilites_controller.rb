class ComptabilitesController < ApplicationController

   def new
    @compta = Comptabilite.new
  end

  def show
    @compta=Comptabilite.find(params[:id])
    @comptas = Comptabilite.all
  end


  def create
    @compta = Comptabilite.new()
    @compta.user_id = current_user
    if @compta.save
        redirect_to rooth_path
    else
        render "new"
    end
  end

  def edit
     @compta = Comptabilite.find(params[:id])
  end

  def update
    @compta = Comptabilite.find(params[:id])
    @compta.update!()
    redirect_to invoice
  end

  def calculate

  end

  def destroy
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.destroy
    redirect_to root
  end

  private


  def comptabilite_params
      params.require(:comptablite).permit!(:immobilisations, :valeur_credit_bail, :primes_remboursement, :charges_repartir, :stocks, :avances, :creance, :effets_escomptes, :valeur_mobilieres, :disponibilites, :capitaux_propres, :dettes_financieres, :emprunt_credit_bail, :dettes_exploitations, :dettes_fiscales, :tresorerie_passive)
  end

end


