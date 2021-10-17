class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :actualites]

  def home
  end

  def actualites
  end

  def dashboard
    @user = current_user
  end

  def services
    @user = current_user
  end

  def cerfa_informations

  end

  def download
    @user = current_user
    cerfa_informations

  end
end
