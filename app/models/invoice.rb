class Invoice < ApplicationRecord
  belongs_to :user
  validates  :amount, :invoiced_at, :object, presence: true
  attribute :amount, :integer, default: 0
  has_and_belongs_to_many :comptabilites
end
