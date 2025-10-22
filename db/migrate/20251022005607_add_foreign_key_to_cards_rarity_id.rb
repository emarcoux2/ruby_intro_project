class AddForeignKeyToCardsRarityId < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :cards, :rarities, column: :rarity
  end
end
