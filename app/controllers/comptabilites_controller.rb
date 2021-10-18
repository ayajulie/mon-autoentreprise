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



  def update
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.update!(comptabilite_params)
    redirect_to root_path

  end


  def calculate


    @comptabilite = Comptabilite.find_by(user_id: params[user_id])

    @charges_variables = @comptabilite.charges_repartir/3
    @charges_fixes = @comptabilite.charges_repartir- @charges_variables


    @bfr = (@comptabilite.stocks+@comptabilite.creance)-(@comptabilite.dettes_exploitations+@comptabilite.dettes_fiscales)
    @caf = (@comptabilite.resultats+@comptabilite.charges_repartir) - (@comptabilite.achats_marchandises)
    @marge = (@comptabilite.ventes_marchandises-@comptabilite.achats_marchandises)
    @taux_marge = @marge/@comptabilite.ventes_marchandises
    @seuil_rentabilite = @comptabilite.chiffre_affaire/@comptabilite.charges_repartir
    @taux_rentabilité = @comptabilite.ventes_marchandises/@comptabilite.achats_marchandises
    @chiffre_a_rentrer = @comptabilite.ventes_marchandises - @comptabilite.achats_marchandises
    @reste_a_payer = @comptabilite.stocks + @comptabilite.valeur_credit_bail
    @ebe = "25 000"
    @marge_cout_variable = @comptabilite.chiffre_affaire - @comptabilite.charges_repartir
    @independance_financière = @comptabilite.capitaux_propres/@comptabilite.dettes_financieres
    @marge_sécurite = "2000"


  end

  def show_calculate
    @comptabilite = Comptabilite.find_by(params[:user_id])

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
    respond_to do |format|
    format.docx do
      render docx: 'presentation_financiere.docx.erb', filename: 'presentation_financiere.docx'

   end
   end
  end

  def destroy
    @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.destroy
    redirect_to root
  end

  def update
     @comptabilite = Comptabilite.find(params[:id])
    @comptabilite.update!(comptabilite_params)
    redirect_to root_path
  end

  private




  def set_user
    @user = current_user

  end

  def comptabilite_params
      params.require(:comptabilite).permit(:immobilisations, :valeur_credit_bail, :charges_repartir, :primes_remboursement, :stocks, :avances, :creance, :effets_escomptes, :valeur_mobilieres,
       :disponibilites, :capitaux_propres, :dettes_financieres, :emprunt_credit_bail,
       :dettes_exploitations, :dettes_fiscales, :tresorerie_passive, :resultats, :achats_marchandises, :chiffre_affaire)
end


end
