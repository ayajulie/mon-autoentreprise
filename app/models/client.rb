class Client < ApplicationRecord
  belongs_to :user
  validates :client, :amout, presence: true
end
