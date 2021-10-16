class AchatsController < ApplicationController

  def new
    @achat = Achat.new()
  end

  def create
    @achat = achat.new(achat_params)
    @achat.user = current_user
    if @miseendemeure.save
        redirect_to achat_show_path(@achat)
    else
        render "new"
    end
  end

  def show
    Achat.find_by(params[:user])
  end

  private

  def achat_params
     params.require(:achat).permit(:name, :amount, :reference, :tva, :date_paiement, :date_facture, :user_id)
  end
end
