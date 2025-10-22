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

ActiveRecord::Schema[8.0].define(version: 2025_10_22_174713) do
  create_table "attacks", force: :cascade do |t|
    t.string "name"
    t.integer "converted_energy_cost"
    t.integer "damage"
    t.text "text"
    t.integer "cards_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cards_id"], name: "index_attacks_on_cards_id"
  end

  create_table "card_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.integer "healthpoints"
    t.integer "card_number"
    t.string "supertype"
    t.string "rarity"
    t.string "card_type"
    t.string "set"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attacks"
  end

  create_table "images", force: :cascade do |t|
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rarities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sets", force: :cascade do |t|
    t.string "name"
    t.date "release_date"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supertypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attacks", "cards", column: "cards_id"
  add_foreign_key "cards", "card_types", column: "card_type"
  add_foreign_key "cards", "images", column: "image_url"
  add_foreign_key "cards", "rarities", column: "rarity"
  add_foreign_key "cards", "sets", column: "set"
  add_foreign_key "cards", "supertypes", column: "supertype"
end
