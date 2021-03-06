class Client < ApplicationRecord
  belongs_to :user
  validates :client, :amout, presence: true
  has_many :invoices
end
