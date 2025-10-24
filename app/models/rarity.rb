class Rarity < ApplicationRecord
  has_many :card
  validates :name, presence: true
end
