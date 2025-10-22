class CreateAttacks < ActiveRecord::Migration[8.0]
  def change
    create_table :attacks do |t|
      t.string :name
      t.integer :converted_energy_cost
      t.integer :damage
      t.text :text
      t.references :cards, null: false, foreign_key: true

      t.timestamps
    end
  end
end
