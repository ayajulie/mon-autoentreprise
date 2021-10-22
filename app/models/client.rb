class Client < ApplicationRecord
  belongs_to :user
  has_many :devis, through: :user
end
