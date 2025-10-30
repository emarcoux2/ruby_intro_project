class CardSet < ApplicationRecord
  has_many :cards, foreign_key: "set_id"
  belongs_to :logo, class_name: "Image"
  validates :name, :series, :release_date, :logo, presence: true
end
