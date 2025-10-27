class Card < ApplicationRecord
  belongs_to :set, :supertype, :rarity, :pokemon_type, :image_url, class_name: "Image"
  has_many :attacks, through: :card_attacks
  validates :name, :card_number, :supertype, :rarity, :set, :image_url, presence: true
end
