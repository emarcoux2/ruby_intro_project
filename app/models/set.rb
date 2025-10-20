class Set < ApplicationRecord
  has_many :cards
  has_one_attached :image
  validates :name, :release_date, :logo, presence: true
end
