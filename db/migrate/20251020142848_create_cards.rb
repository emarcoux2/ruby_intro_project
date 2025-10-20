class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :healthpoints
      t.integer :card_number
      t.string :supertype
      t.string :rarity
      t.string :type
      t.string :set
      t.string :image_url

      t.timestamps
    end
  end
end
