class ComptabilitesController < ApplicationController

<<<<<<< HEAD
  skip_before_action :verify_authenticity_token


  def new
    @comptabilite= Comptabilite.new
  end

  def show
    @comptabilite=Comptabilite.find(params[:id])
    @comptabilites = Comptabilite.all
=======
   def new
    @compta = Comptabilite.new
  end

  def show
    @compta=Comptabilite.find(params[:id])
    @comptas = Comptabilite.all
>>>>>>> devis
  end


  def create
<<<<<<< HEAD
    @comptabilite = Comptabilite.new(comptabilite_params)
    @comptabilite.user = current_user
    if @comptabilite.save
        redirect_to root_path
=======
    @compta = Comptabilite.new()
    @compta.user_id = current_user
    if @compta.save
        redirect_to rooth_path
>>>>>>> devis
    else
        render "new"
    end
  end

  def edit
<<<<<<< HEAD
     @comptabilite = Comptabilite.find(params[:id])
  end

  def update
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.update!(comptabilite_params)
    redirect_to root_path
=======
     @compta = Comptabilite.find(params[:id])
  end

  def update
    @compta = Comptabilite.find(params[:id])
    @compta.update!()
    redirect_to invoice
>>>>>>> devis
  end

  def calculate

<<<<<<< HEAD
    @comptabilite = Comptabilite.find_by(params[:user])

    @bfr = (Comptabilite(:stocks)+Comptabilite(:creance))-(Comptabilite(:dettes_exploitations)+Comptabilite(:dettes_fiscales))
    @caf = (Comptabilite(:resultats)+Comptabilite(:charges_repartir)) - (Comptabilite(:produits))
    @marge = (Comptabilite(:vente_marchandise)-Comptabilite(:achats_marchandises))
    @taux_marge = @marge/Comptabilite(:vente_marchandise)
    @seuil_rentabilite = Comptabilite(:charges_repartir)/Comptabilite(:chiffre_affaire)

=======
>>>>>>> devis
  end

  def destroy
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.destroy
    redirect_to root
  end

  private

<<<<<<< HEAD
  def set_name

    @compta.name = current_user
  end

  def comptabilite_params
      params.require(:comptabilite).permit(:immobilisations, :valeur_credit_bail, :charges_repartir, :primes_remboursement, :stocks, :avances, :creance, :effets_escomptes, :valeur_mobilieres,
       :disponibilites, :capitaux_propres, :dettes_financieres, :emprunt_credit_bail,
       :dettes_exploitations, :dettes_fiscales, :tresorerie_passive)
=======

  def comptabilite_params
      params.require(:comptablite).permit!(:immobilisations, :valeur_credit_bail, :primes_remboursement, :charges_repartir, :stocks, :avances, :creance, :effets_escomptes, :valeur_mobilieres, :disponibilites, :capitaux_propres, :dettes_financieres, :emprunt_credit_bail, :dettes_exploitations, :dettes_fiscales, :tresorerie_passive)
>>>>>>> devis
  end

end


