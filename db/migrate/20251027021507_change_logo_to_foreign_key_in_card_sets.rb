class ChangeLogoToForeignKeyInCardSets < ActiveRecord::Migration[8.0]
  def change
    remove_column :card_sets, :logo, :string
    add_reference :card_sets, :logo, foreign_key: { to_table: :images }
  end
end
