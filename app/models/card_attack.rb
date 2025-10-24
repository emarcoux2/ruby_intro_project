class CardAttack < ApplicationRecord
  belongs_to :attack
  belongs_to :card
end
