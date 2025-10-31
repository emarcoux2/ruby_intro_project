class Attack < ApplicationRecord
  has_many :card_attacks, dependent: :destroy
  has_many :cards, through: :card_attacks
end
