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

ActiveRecord::Schema.define(version: 20170629155834) do

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "current",    default: 0
    t.integer  "round",      default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "uuid"
    t.string   "game_name"
    t.integer  "user_id"
    t.string   "user_uuid"
    t.integer  "eco",        default: 0
    t.integer  "bank"
  end

  create_table "nations", force: :cascade do |t|
    t.string   "name"
    t.string   "roundel"
    t.string   "color"
    t.integer  "bank"
    t.integer  "income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
    t.integer  "nid"
    t.string   "colorL"
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "special"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "movement"
    t.integer  "cost"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
    t.integer  "uid"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uuid"
  end

end