class Comptabilite < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: true
  has_many :invoices

end
