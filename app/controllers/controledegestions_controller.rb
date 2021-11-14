class ControledegestionsController < ApplicationController

  def new
    @controledegestion= ControleDeGestion.new
  end

  def create
  end

  def calculate
  end

  private

  def set_params
    params.require(:controledegestion).permit( :cost, :variable_cost, :unit_cost, :budget, :user_id)
  end
end
