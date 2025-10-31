class Image < ApplicationRecord
  has_many :cards, foreign_key: "image_url_id", dependent: :nullify
  has_many :card_sets, foreign_key: "logo_id", dependent: :nullify
  validates :image_url, presence: true
end
