class Comptabilite < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: true
  has_and_belongs_to_many :invoices

end
