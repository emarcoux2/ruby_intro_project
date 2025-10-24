class CreateCardAttacks < ActiveRecord::Migration[8.0]
  def change
    create_table :card_attacks do |t|
      t.references :attacks, null: false, foreign_key: true
      t.references :cards, null: false, foreign_key: true

      t.timestamps
    end
  end
end
