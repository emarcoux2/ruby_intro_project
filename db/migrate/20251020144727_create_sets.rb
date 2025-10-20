class CreateSets < ActiveRecord::Migration[8.0]
  def change
    create_table :sets do |t|
      t.string :name
      t.date :release_date
      t.string :logo

      t.timestamps
    end
  end
end
