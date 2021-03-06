class Client < ApplicationRecord
  belongs_to :user
  validates :name, :amout, presence: true
  has_many :invoices
end
