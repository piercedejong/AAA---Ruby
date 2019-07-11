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

ActiveRecord::Schema.define(version: 2019_07_09_170957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battle_calculators", force: :cascade do |t|
    t.integer "user_id"
    t.string "uuid"
    t.string "user_uuid"
    t.string "winner"
    t.string "game"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "current", default: 0
    t.integer "round", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.string "game_name"
    t.integer "user_id"
    t.string "user_uuid"
    t.integer "eco", default: 0
    t.integer "bank"
  end

  create_table "nations", force: :cascade do |t|
    t.string "name"
    t.string "roundel"
    t.string "color"
    t.integer "bank"
    t.integer "income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.integer "nid"
    t.string "colorL"
    t.string "uuid"
    t.integer "obj_income", default: 0
  end

  create_table "objectives", force: :cascade do |t|
    t.integer "nation_id"
    t.integer "value"
    t.string "name"
    t.text "info"
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "oid"
  end

  create_table "researches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.string "text"
    t.boolean "enabled", default: false
    t.string "nation_uuid"
    t.integer "nation_id"
    t.integer "rid"
    t.string "name"
  end

  create_table "specials", force: :cascade do |t|
    t.string "title"
    t.string "info"
    t.string "unit_id"
    t.integer "sid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit_name"
    t.string "game"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "special", default: ""
    t.integer "attack"
    t.integer "defense"
    t.integer "movement"
    t.integer "cost"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.integer "uid"
    t.string "uuid"
  end

  create_table "users", id: false, force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "id"
    t.boolean "sepia", default: false
    t.string "role", default: "user"
    t.string "password_digest"
  end

  create_table "victories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.boolean "axis"
    t.string "text"
    t.boolean "enabled", default: false
    t.integer "vid"
    t.string "name"
    t.string "game_uuid"
    t.integer "game_id"
    t.string "nation"
  end

end
