class UsersController < ApplicationController
  def personal_info_users
    @user = current_user
  end

  def company_info_users
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to root_path
    else
      render :personal_info_users
    end

    #met à jour mon utilisateur avec les données de mon user
    # en fonction de l'état de remplissage je redirige vers une page différente personal_info ou
    # utilisant current_user.form_company_filled? true = redirige vers l'étape suivante, false màj de la company
  end


  private

  def user_params
  params.require(:user).permit(:first_name, :last_name, :birth_name, :company_name, :company_address)
  end

end
