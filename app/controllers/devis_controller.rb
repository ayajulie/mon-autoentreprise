class DevisController < ApplicationController

  def index
    @devis = Devi.all
  end

<<<<<<< HEAD
=======
   def show
    @devi=Devi.find(params[:id])
    @devis = Devi.all
  end


>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
  def new
   @devi = Devi.new
  end

  def create
    @devi = Devi.new(devis_params)
    if @devi.save
<<<<<<< HEAD
      redirect_to root_path
=======
      redirect_to dashboard_path
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
    else
      render "new"
    end
  end

<<<<<<< HEAD
=======
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
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91

  private

  def devis_params
<<<<<<< HEAD
    params.require(:devi).pemit(:objet, :devis_at, :amount, :success)
=======
    params.require(:devi).permit(:name, :objet, :devis_at, :amount, :success)
>>>>>>> 2af684f29dca831117579e4b7e4e6c6ae108ce91
  end
end
