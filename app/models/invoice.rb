class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :user
  validates  :amount, :date, :object, presence: true
end
