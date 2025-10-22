class AddAttacksToCards < ActiveRecord::Migration[8.0]
  def change
    add_column :cards, :attacks, :string
  end
end
