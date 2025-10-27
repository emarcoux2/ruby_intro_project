class Image < ApplicationRecord
  has_many :cards, foreign_key: "image_url"
  has_many :sets, foreign_key: "logo"
  validates :image_url, presence: true
end
