class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :user
  validates  :amount, :invoiced_at, :object, presence: true
end
