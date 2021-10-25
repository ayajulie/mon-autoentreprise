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
    @devi.user = current_user
    if @devi.save
      redirect_to devi_path(@devi)
    else
      render "new"
    end
  end

require "sablon"
  def show

 respond_to do |format|
    format.docx do

template = Sablon.template(File.expand_path("~/code/mon-autoentreprise/lib/assets/modèle_devis.docx"))
context = {
  title: "Fabulous Document",
  technologies: ["Ruby", "HTML", "ODF"]
}
template.render_to_file File.expand_path("~/output.docx"), context
   end
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
    params.require(:devi).permit( :name, :object, :devis_at, :amount, :success, :user_id)

  end
end
