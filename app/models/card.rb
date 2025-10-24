class Card < ApplicationRecord
  has_many :card_attacks, :set, :supertype, :rarity, :pokemon_type
  has_many :attacks, through: :card_attacks
  validates :name, :card_number, :supertype, :rarity, :set, :image_url, presence: true
end
