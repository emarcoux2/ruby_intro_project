class RenameSetIdColumnInCardsTable < ActiveRecord::Migration[8.0]
  def change
    rename_column :cards, :set_id, :card_set_id
  end
end
