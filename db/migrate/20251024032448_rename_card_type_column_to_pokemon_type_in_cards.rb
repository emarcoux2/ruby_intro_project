class RenameCardTypeColumnToPokemonTypeInCards < ActiveRecord::Migration[8.0]
  def change
    rename_column :cards, :card_type, :pokemon_type
  end
end
