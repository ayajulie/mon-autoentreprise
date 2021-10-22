class Invoice < ApplicationRecord
  belongs_to :user
  validates  :amount, :invoiced_at, :object, presence: true
  attribute :amount, :integer, default: 0
  belongs_to :client
  belongs_to :comptabilites
end
