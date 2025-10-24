class Image < ApplicationRecord
  has_many :card, :set
  validates :image_url, presence: true
end
