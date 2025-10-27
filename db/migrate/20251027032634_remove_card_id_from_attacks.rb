class RemoveCardIdFromAttacks < ActiveRecord::Migration[8.0]
  def change
    remove_column :attacks, :card_id
  end
end
