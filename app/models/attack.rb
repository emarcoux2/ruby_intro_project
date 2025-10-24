class Attack < ApplicationRecord
  has_many :card_attacks
  has_many :cards, through: :card_attacks
end
