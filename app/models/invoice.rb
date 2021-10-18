class Invoice < ApplicationRecord
  belongs_to :user
  validates  :amount, :invoiced_at, :object, presence: true
  belongs_to :client
end
