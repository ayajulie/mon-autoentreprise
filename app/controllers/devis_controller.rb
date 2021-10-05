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
      redirect_to root_path
    else
      render "new"
    end
  end

  def update
    @devi = Devi.find(params[:id])
  end


  private

  def devis_params
    params.require(:devi).pemit(:objet, :devis_at, :amount, :success)
  end
end
