# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140620193401) do

  create_table "heros", force: true do |t|
    t.string   "name"
    t.string   "lname"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "item_id"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "performances", force: true do |t|
    t.string   "performance_id"
    t.string   "hero_id"
    t.string   "item_0"
    t.string   "item_1"
    t.string   "item_2"
    t.string   "item_3"
    t.string   "item_4"
    t.string   "item_5"
    t.integer  "level"
    t.integer  "kills"
    t.integer  "deaths"
    t.integer  "assists"
    t.integer  "last_hits"
    t.integer  "denies"
    t.integer  "gpm"
    t.integer  "xpm"
    t.integer  "hero_damage"
    t.integer  "tower_damage"
    t.integer  "hero_healing"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
