class Set < ApplicationRecord
  has_many :cards
  belongs_to :logo, class_name: "Image"
  validates :name, :release_date, :logo, presence: true
end
