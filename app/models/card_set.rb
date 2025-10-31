class CardSet < ApplicationRecord
  has_many :cards, foreign_key: "card_set_id", dependent: :destroy
  belongs_to :logo, class_name: "Image"
  validates :name, :series, :release_date, :logo, presence: true
end
