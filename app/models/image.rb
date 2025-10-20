class Image < ApplicationRecord
  has_one :card, :set
  validates :image_url, presence: true
end
