class MiseendemeuresController < ApplicationController

def new
  @miseendemeure =Miseendemeure.new()
end

def create
  @miseendemeure = Miseendemeure.new(miseendemeure_params)
    @miseendemeure.user = current_user
    if @miseendemeure.save
        redirect_to invoices_calculate_path
    else
        render "new"
    end
end

def show
    @miseen = Miseendemeure.find(params[:id])
    respond_to do |format|
    format.docx do
      render docx: 'miseendemeure.docx.erb', filename: 'mise_en_demeure.docx'
  end

end
end


private


def miseendemeure_params
  params.require(:miseendemeure).permit(:denomination_sociale, :creance, :creance_at, :user_id)
end

end
