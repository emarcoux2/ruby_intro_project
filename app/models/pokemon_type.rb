class PokemonType < ApplicationRecord
  belongs_to :card
  validates :name, presence: true
end
