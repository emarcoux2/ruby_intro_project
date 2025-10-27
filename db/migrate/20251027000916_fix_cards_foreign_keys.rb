class FixCardsForeignKeys < ActiveRecord::Migration[8.0]
  def change
    remove_column :cards, :supertype, :string
    remove_column :cards, :rarity, :string
    remove_column :cards, :pokemon_type, :string
    remove_column :cards, :set, :string
    remove_column :cards, :image_url, :string
    remove_column :cards, :attacks, :string

    add_reference :cards, :supertype, foreign_key: true
    add_reference :cards, :rarity, foreign_key: true
    add_reference :cards, :pokemon_type, foreign_key: true
    add_reference :cards, :set, foreign_key: true
    add_reference :cards, :image_url, foreign_key: { to_table: :images }

    rename_column :attacks, :cards_id, :card_id
    change_column :attacks, :card_id, :bigint, null: false
    add_foreign_key :attacks, :cards
  end
end
