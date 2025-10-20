class Card < ApplicationRecord
  belongs_to :set, :supertype, :rarity, :card_type
  has_one_attached :image
  validates :name, :card_number, :supertype, :rarity, :set, :image_url, presence: true
end
