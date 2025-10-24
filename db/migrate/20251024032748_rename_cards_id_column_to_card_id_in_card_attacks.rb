class RenameCardsIdColumnToCardIdInCardAttacks < ActiveRecord::Migration[8.0]
  def change
    rename_column :card_attacks, :cards_id, :card_id
  end
end
