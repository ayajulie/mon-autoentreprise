class ControledegestionsController < ApplicationController

  def new
    @controledegestion = ControleDeGestion.new()
  end

  def create
    @controledegestion= ControleDeGestion.new(set_params)
    @controledegestion.user = current_user
    if @controledegestion.save
        redirect_to achat_path(@achat)
    else
        render "new"
    end

  end

  def calculate
  end

  private

  def set_params
    params.require(:controledegestion).permit( :cost, :variable_cost, :unit_cost, :budget, :user_id)
  end
end
