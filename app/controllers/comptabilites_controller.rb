class ComptabilitesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @comptabilite= Comptabilite.new
  end

  def show
    @comptabilite=Comptabilite.find(params[:id])
    @comptabilites = Comptabilite.all
  end


  def create
    @comptabilite = Comptabilite.new(comptabilite_params)
    @comptabilite.user = current_user
    if @comptabilite.save
        redirect_to root_path
    else
        render "new"
    end
  end

  def edit
     @comptabilite = Comptabilite.find(params[:id])
  end

  def update
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.update!(comptabilite_params)
    redirect_to root_path
  end

  def calculate

    @bfr = (Comptabilite(:stocks)+Comptabilite(:creance))-(Comptabilite(:dettes_exploitations)+Comptabilite(:dettes_fiscales))
    @caf = (Comptabilite(:resultats)+Comptabilite(:charges_repartir)) - (Comptabilite(:produits))
    @marge = (Comptabilite(:vente_marchandise)-Comptabilite(:achats_marchandises))

  end

  def destroy
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.destroy
    redirect_to root
  end

  private

  def comptabilite_params
      params.require(:comptabilite).permit(:immobilisations, :valeur_credit_bail, :charges_repartir, :primes_remboursement, :stocks, :avances, :creance, :effets_escomptes, :valeur_mobilieres,
       :disponibilites, :capitaux_propres, :dettes_financieres, :emprunt_credit_bail,
       :dettes_exploitations, :dettes_fiscales, :tresorerie_passive)
  end

end


