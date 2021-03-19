class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :user
  validates  :amount, :invoice_date, :object, presence: true
end
