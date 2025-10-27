class RenameSetsToCardSets < ActiveRecord::Migration[8.0]
  def change
    rename_table :sets, :card_sets
  end
end
