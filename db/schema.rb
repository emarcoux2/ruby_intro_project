# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_29_235809) do
  create_table "attacks", force: :cascade do |t|
    t.string "name"
    t.integer "converted_energy_cost"
    t.integer "damage"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_attacks", force: :cascade do |t|
    t.integer "attack_id", null: false
    t.integer "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attack_id"], name: "index_card_attacks_on_attack_id"
    t.index ["card_id"], name: "index_card_attacks_on_card_id"
  end

  create_table "card_sets", force: :cascade do |t|
    t.string "name"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "logo_id"
    t.string "series"
    t.index ["logo_id"], name: "index_card_sets_on_logo_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.integer "healthpoints"
    t.integer "card_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supertype_id"
    t.integer "rarity_id"
    t.integer "pokemon_type_id"
    t.integer "card_set_id"
    t.integer "image_url_id"
    t.index ["card_set_id"], name: "index_cards_on_card_set_id"
    t.index ["image_url_id"], name: "index_cards_on_image_url_id"
    t.index ["pokemon_type_id"], name: "index_cards_on_pokemon_type_id"
    t.index ["rarity_id"], name: "index_cards_on_rarity_id"
    t.index ["supertype_id"], name: "index_cards_on_supertype_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rarities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supertypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "card_attacks", "attacks"
  add_foreign_key "card_attacks", "cards"
  add_foreign_key "card_sets", "images", column: "logo_id"
  add_foreign_key "cards", "card_sets"
  add_foreign_key "cards", "images", column: "image_url_id"
  add_foreign_key "cards", "pokemon_types"
  add_foreign_key "cards", "rarities"
  add_foreign_key "cards", "supertypes"
end
