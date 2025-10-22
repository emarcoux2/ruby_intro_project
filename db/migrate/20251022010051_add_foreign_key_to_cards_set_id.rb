class AddForeignKeyToCardsSetId < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :cards, :sets, column: :set
  end
end
