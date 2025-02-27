# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_08_230418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "infection_alerts", force: :cascade do |t|
    t.bigint "infected_survivor_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_infection_alerts_on_author_id"
    t.index ["infected_survivor_id"], name: "index_infection_alerts_on_infected_survivor_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "survivor_id"
    t.string "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survivor_id"], name: "index_items_on_survivor_id"
  end

  create_table "survivors", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.string "gender", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "gender"], name: "index_survivors_on_name_and_gender", unique: true
  end

  add_foreign_key "infection_alerts", "survivors", column: "author_id"
  add_foreign_key "infection_alerts", "survivors", column: "infected_survivor_id"
  add_foreign_key "items", "survivors"
end
