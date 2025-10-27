class Card < ApplicationRecord
  belongs_to :set, class_name: "CardSet", foreign_key: "set_id"
  belongs_to :supertype, :rarity, :pokemon_type, :image_url, class_name: "Image"
  has_many :card_attacks
  has_many :attacks, through: :card_attacks
  validates :name, :card_number, :supertype, :rarity, :card_set, :image_url, presence: true
end
