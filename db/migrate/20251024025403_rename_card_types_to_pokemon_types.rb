class RenameCardTypesToPokemonTypes < ActiveRecord::Migration[8.0]
  def change
    rename_table :card_types, :pokemon_types
  end
end
