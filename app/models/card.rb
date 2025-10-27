class Card < ApplicationRecord
  belongs_to :card_set
  belongs_to :supertype
  belongs_to :rarity
  belongs_to :pokemon_type, optional: true
  belongs_to :image_url, class_name: "Image"

  has_many :card_attacks
  has_many :attacks, through: :card_attacks
  validates :name, :card_number, :supertype, :rarity, :card_set, :image_url, presence: true
end
