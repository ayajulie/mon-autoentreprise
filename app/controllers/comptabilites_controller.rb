class ComptabilitesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:edit, :upadate, :destroy, :calculate]


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

    @comptabilite = Comptabilite.find_by(params[:user])

    @bfr = (@comptabilite.stocks+@comptabilite.creance)-(@comptabilite.dettes_exploitations+@comptabilite.dettes_fiscales)
    @caf = (@comptabilite.resultats+@comptabilite.charges_repartir) - (@comptabilite.achats_marchandises)
    @marge = (@comptabilite.ventes_marchandises-@comptabilite.achats_marchandises)
    @taux_marge = @marge/@comptabilite.ventes_marchandises
    @seuil_rentabilite = @comptabilite.ventes_marchandises/@comptabilite.chiffre_affaire
    @taux_rentabilité = @ventes_marchandises/@achats_marchandises
    @chiffre_a_rentrer = @ventes_marchandises - @achats_marchandises

  end

  def destroy
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.destroy
    redirect_to root
  end

  private

  def set_user
    @user = current_user
  end

  def comptabilite_params
      params.require(:comptabilite).permit(:immobilisations, :valeur_credit_bail, :charges_repartir, :primes_remboursement, :stocks, :avances, :creance, :effets_escomptes, :valeur_mobilieres,
       :disponibilites, :capitaux_propres, :dettes_financieres, :emprunt_credit_bail,
       :dettes_exploitations, :dettes_fiscales, :tresorerie_passive)
  end

end


