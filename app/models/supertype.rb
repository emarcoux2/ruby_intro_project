class Supertype < ApplicationRecord
  has_many :card
  validates :name, presence: true
end
