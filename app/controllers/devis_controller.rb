class DevisController < ApplicationController

  def index
    @devis = Devi.all
  end


   def show
    @devi=Devi.find(params[:id])
    @devis = Devi.all
  end



  def new
   @devi = Devi.new
  end

  def create
    @devi = Devi.new(devis_params)
    if @devi.save


      redirect_to dashboard_path

    else
      render "new"
    end
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

  def devis_params
    params.require(:devi).permit(:name, :objet, :devis_at, :amount, :success)

  end
end
