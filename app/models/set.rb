class Set < ApplicationRecord
  has_many :cards
  validates :name, :release_date, :logo, presence: true
end
