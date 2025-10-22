class AddForeignKeyToCardsImageUrl < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :cards, :images, column: :image_url
  end
end
