class DevisController < ApplicationController

  def index
    @devis = Devi.where(user:current_user)
    @somme_devis = Devi.where(user:current_user).sum(:amount)
  end



  def new
   @devi = Devi.new
  end

  def create
    @devi = Devi.new(devis_params)
    @devi.user = current_user
    if @devi.save
      redirect_to devi_path
    else
      render "new"
    end
  end


  def show

  end




  def search
   @resultat= find_with(params[:siren])
  end

  def edit
     @devi = Devi.find(params[:id])
  end

  def update
    @devi= Devi.find(params[:id])
    @devi.update!(devis_params)
    redirect_to root_path
  end

  def destroy
    @devi = Devi.find(params[:id])
    @devi.destroy
    redirect_to root
  end



  private



  KEY = ENV['DATA_KEY']


  def devis_params
    params.require(:devi).permit( :name, :object, :devis_at, :amount, :success, :user_id)

  end

  def find_with(siren)
    @request = HTTParty.get('https://api.datainfogreffe.fr/api/v1/Entreprise/notapme/performance/(siren)?api_key=KEY')
    @result = JSON.parse(@request.body)
  end


end
