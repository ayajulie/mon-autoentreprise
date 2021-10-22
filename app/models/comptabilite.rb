class Comptabilite < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: true
  has_many_and_belongs_to :invoices

end
