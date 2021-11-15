class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients
  has_many :invoices
  has_many :comptabilites
  has_many :miseendemeures
  has_many :relances
  has_many :achats
  has_many :devis
  has_many :gestions

  def form_user_filled?
    first_name.present? && birth_last_name.present? && ssn.present?
  end

  def form_company_at_least_one_filled?
    company_name.present?
  end

  def form_company_all_filled?
    company_name.present? && company_address.present? && company_city.present? && company_zipcode.present?
  end
end
