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

  include HTTParty

  BASE_URL = https://api.datainfogreffe.fr/api/v1/Entreprise/notapme/performance/
  KEY = ENV[DATA_KEY]

  def query
    request = HTTParty.get(BASE_URL+@search_format+KEY).to_json
  end

  def initialize(user_serach_input)
    @search_format= "q=#{user_serach_input.gsub}"
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

  key = ENV[DATA_KEY]

  def devis_params
    params.require(:devi).permit( :name, :object, :devis_at, :amount, :success, :user_id)

  end

  def url
    @url = https://api.datainfogreffe.fr/api/v1/Entreprise/notapme/performance/{id}?token={key}
  end
end
