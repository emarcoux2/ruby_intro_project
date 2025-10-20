class CreateSupertypes < ActiveRecord::Migration[8.0]
  def change
    create_table :supertypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
