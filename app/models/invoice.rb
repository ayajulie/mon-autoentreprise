class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :user
  validates :name, :amount, :date, :object, presence: true
  validates :name, :amount, :date, :object, uniqueness: true
end
