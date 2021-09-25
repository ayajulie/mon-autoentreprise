class ComptabilitesController < ApplicationController

   def new
    @compta = Comptabilite.new
  end

  def show
    @compta=Comptabilite.find(params[:id])
    @comptas = Comptabilite.all
  end


  def create
    @compta = Comptabilite.new(comptabilite_params)
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
    @compta.update!(comptabilite_params)
    redirect_to invoice
  end

  def calculate

    @bfr = (Comptabilite(:stocks)+Comptabilite(:creance))-Comptabilite(:dettes_exploitations)+Comptabilite(:dettes_fiscales))
    @caf = (Comptabilite(:resultats) -+Comptabilite(:charges_repartir)) - (Comptabilite(:produits))
    @marge = (Comptabilite(:vente_marchandise)-Comptabilite(:achats_marchandises))

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


