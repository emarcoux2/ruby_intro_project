class AddSeriesToCardSet < ActiveRecord::Migration[8.0]
  def change
    add_column :card_sets, :series, :string
  end
end
