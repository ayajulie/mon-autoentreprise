class MiseendemeuresController < ApplicationController

def new
  @miseendemeure =Miseendemeure.new()
end

def create
  @miseendemeure = Miseendemeure.new(miseendemeure_params)
    @miseendemeure.user = current_user
    if @miseendemeure.save
        redirect_to miseendemeure_show_path(@miseendemeure)
    else
        render "new"
    end
end

def show
    @today = Date.current
    @miseendemeure = Miseendemeure.find(params[:id])
    respond_to do |format|
    format.docx do
      render docx: 'miseendemeure.docx.erb', filename: 'mise_en_demeure.docx'
  end

end
end


private


def miseendemeure_params
  params.require(:miseendemeure).permit(:name, :adress, :refence, :day, :amount, :user_id)
end

end
