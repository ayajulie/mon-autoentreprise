class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def personal_info_users
    # if @user.form_user_filled?
    #  redirect_to company_info_users_path
    # end
  end

  def company_info_users
    # if @user.form_company_all_filled?
    #  redirect_to company_registration_path
    # end
  end

  def update
    @user.update(user_params)
    if @user.form_user_filled? && !@user.form_company_at_least_one_filled?
      redirect_to company_registration_path(tab: "company_info")
    elsif @user.form_user_filled? && @user.form_company_all_filled?
      redirect_to company_registration_path(tab: "cerfa")
    else
      redirect_to company_registration_path
    end
    # met à jour mon utilisateur avec les données de mon user
    # en fonction de l'état de remplissage je redirige vers une page différente personal_info ou
    # utilisant current_user.form_company_filled? true = redirige vers l'étape suivante, false màj de la company
  end

  def my_informations
  end

  def company_registration
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_last_name, :use_name, :pseudonym, :citizenship,
                                 :gender, :birth_date, :birth_city, :birth_department, :birth_country, :address, :city, :zipcode, :country, :spouse_working_in_company,
                                 :phone_number, :ssn, :remarks,
                                 :company_name, :company_address, :company_city, :company_city, :company_zipcode, :company_country,
                                 :start_activity, :seasonal_activity, :itinerant_activity, :main_activity_freetext, :main_activity_choose, :employee,
                                 :partner, :siren, :individual_entrepreneur, :bic_status, :contribution_periodicity, :other_activity, :income_tax_lump_payment,
                                 :exercising_mode_declaration, :business_origin, :establishment_address, :paying_agent, :past_salaried_activity)
  end

  def set_user
    @user = current_user
  end
end
