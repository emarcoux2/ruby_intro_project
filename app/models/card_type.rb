class CardType < ApplicationRecord
  has_one :card
  validates :name, presence: true
end
