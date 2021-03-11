class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients
  has_many :invoices


  def form_user_filled?
    first_name.present? && use_name.present? && birth_last_name.present? && citizenship.present? && ssn.present?
  end

  def form_company_at_least_one_filled?
    company_name.present? || company_address.present?
  end

  def form_company_all_filled?
    company_name.present? && company_address.present? && company_city.present? &&company_zipcode.present?
  end

end
