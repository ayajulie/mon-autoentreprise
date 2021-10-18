class Client < ApplicationRecord
  belongs_to :user
  validates :client, :amout, presence: true
  has_many :devis, through: :user
  has_many :invoices, through: :user
end
