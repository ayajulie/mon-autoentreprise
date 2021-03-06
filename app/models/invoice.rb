class Invoice < ApplicationRecord
  belongs_to :clients
  belongs_to :users
  validates :name, :amount, :date, :object, presence: true
  validates :name, :amount, :date, :object, uniqueness: true
end
