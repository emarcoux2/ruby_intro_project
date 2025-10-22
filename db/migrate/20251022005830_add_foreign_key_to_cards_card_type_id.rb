class AddForeignKeyToCardsCardTypeId < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :cards, :card_types, column: :card_type
  end
end
