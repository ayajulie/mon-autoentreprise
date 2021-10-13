class ComptabilitesController < ApplicationController

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  skip_before_action :verify_authenticity_token
=======

  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:edit, :upadate, :destroy, :calculate]
>>>>>>> f9cbba738f684312612d3aae8756807a9d8dd46f


  def new
    @comptabilite= Comptabilite.new
<<<<<<< HEAD
  end

  def show
    @comptabilite=Comptabilite.find(params[:id])
    @comptabilites = Comptabilite.all
=======
=======
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
   def new
    @compta = Comptabilite.new
  end

  def show
    @compta=Comptabilite.find(params[:id])
    @comptas = Comptabilite.all
<<<<<<< HEAD
>>>>>>> devis
=======
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
  end


  def create
<<<<<<< HEAD
<<<<<<< HEAD
=======
  end

  def show
    @comptabilite=Comptabilite.find(params[:id])
    @comptabilites = Comptabilite.all




  def create

>>>>>>> f9cbba738f684312612d3aae8756807a9d8dd46f
    @comptabilite = Comptabilite.new(comptabilite_params)
    @comptabilite.user = current_user
    if @comptabilite.save
        redirect_to root_path
<<<<<<< HEAD
=======
=======
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
    @compta = Comptabilite.new()
    @compta.user_id = current_user
    if @compta.save
        redirect_to rooth_path
<<<<<<< HEAD
>>>>>>> devis
=======
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
=======

>>>>>>> f9cbba738f684312612d3aae8756807a9d8dd46f
    else
        render "new"
    end
  end

  def edit
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
     @comptabilite = Comptabilite.find(params[:id])
  end

  def update
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.update!(comptabilite_params)
    redirect_to root_path
=======
=======
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
     @compta = Comptabilite.find(params[:id])
  end

  def update
    @compta = Comptabilite.find(params[:id])
    @compta.update!()
    redirect_to invoice
<<<<<<< HEAD
>>>>>>> devis
=======
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
=======

     @comptabilite = Comptabilite.find(params[:id])
  end

  def update
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.update!(comptabilite_params)
    redirect_to root_path

>>>>>>> f9cbba738f684312612d3aae8756807a9d8dd46f
  end


  def calculate

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    @comptabilite = Comptabilite.find_by(params[:user])

    @bfr = (Comptabilite(:stocks)+Comptabilite(:creance))-(Comptabilite(:dettes_exploitations)+Comptabilite(:dettes_fiscales))
    @caf = (Comptabilite(:resultats)+Comptabilite(:charges_repartir)) - (Comptabilite(:produits))
    @marge = (Comptabilite(:vente_marchandise)-Comptabilite(:achats_marchandises))
    @taux_marge = @marge/Comptabilite(:vente_marchandise)
    @seuil_rentabilite = Comptabilite(:charges_repartir)/Comptabilite(:chiffre_affaire)

=======
>>>>>>> devis
=======
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
=======

    @comptabilite = Comptabilite.find_by(params[:user])

    @charges_variables = @comptabilite.charges_repartir/3
    @charges_fixes = @comptabilite.charges_repartir- @charges_variables


    @bfr = (@comptabilite.stocks+@comptabilite.creance)-(@comptabilite.dettes_exploitations+@comptabilite.dettes_fiscales)
    @caf = (@comptabilite.resultats+@comptabilite.charges_repartir) - (@comptabilite.achats_marchandises)
    @marge = (@comptabilite.ventes_marchandises-@comptabilite.achats_marchandises)
    @taux_marge = @marge/@comptabilite.ventes_marchandises
    @seuil_rentabilite = @comptabilite.chiffre_affaire/@charges_fixes
    @taux_rentabilité = @comptabilite.ventes_marchandises/@comptabilite.achats_marchandises
    @chiffre_a_rentrer = @comptabilite.ventes_marchandises - @comptabilite.achats_marchandises
    @reste_a_payer = @comptabilite.stocks + @comptabilite.valeur_credit_bail
    @ebe = "25 000"
    @marge_cout_variable = @comptabilite.chiffre_affaire - @comptabilite.charges_repartir
    @independance_financière = @comptabilite.capitaux_propres/@comptabilite.dettes_financieres
    @marge_sécurite = "2000"


>>>>>>> f9cbba738f684312612d3aae8756807a9d8dd46f
  end

  def destroy
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.destroy
    redirect_to root
  end

  private

<<<<<<< HEAD
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
=======

<<<<<<< HEAD
  def comptabilite_params
      params.require(:comptablite).permit!(:immobilisations, :valeur_credit_bail, :primes_remboursement, :charges_repartir, :stocks, :avances, :creance, :effets_escomptes, :valeur_mobilieres, :disponibilites, :capitaux_propres, :dettes_financieres, :emprunt_credit_bail, :dettes_exploitations, :dettes_fiscales, :tresorerie_passive)
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
=======
  def set_user
    @user = current_user
>>>>>>> f9cbba738f684312612d3aae8756807a9d8dd46f
  end

  def comptabilite_params
      params.require(:comptabilite).permit(:immobilisations, :valeur_credit_bail, :charges_repartir, :primes_remboursement, :stocks, :avances, :creance, :effets_escomptes, :valeur_mobilieres,
       :disponibilites, :capitaux_propres, :dettes_financieres, :emprunt_credit_bail,
       :dettes_exploitations, :dettes_fiscales, :tresorerie_passive)



end


