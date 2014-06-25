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

ActiveRecord::Schema.define(version: 20140625014732) do

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

  create_table "matches", force: true do |t|
    t.string   "match_id"
    t.string   "winner"
    t.string   "duration"
    t.string   "radiant_team_id"
    t.string   "dire_team_id"
    t.string   "player_0_id"
    t.string   "player_1_id"
    t.string   "player_2_id"
    t.string   "player_3_id"
    t.string   "player_4_id"
    t.string   "player_5_id"
    t.string   "player_6_id"
    t.string   "player_7_id"
    t.string   "player_8_id"
    t.string   "player_9_id"
    t.string   "first_pick"
    t.string   "ap_remake"
    t.string   "d_ban_0"
    t.string   "r_ban_0"
    t.string   "d_ban_1"
    t.string   "r_ban_1"
    t.string   "d_pick_0"
    t.string   "r_pick_0"
    t.string   "r_pick_1"
    t.string   "d_pick_1"
    t.string   "d_ban_2"
    t.string   "r_ban_2"
    t.string   "d_ban_3"
    t.string   "r_ban_3"
    t.string   "r_pick_2"
    t.string   "d_pick_2"
    t.string   "r_pick_3"
    t.string   "d_pick_3"
    t.string   "r_ban_4"
    t.string   "d_ban_4"
    t.string   "r_pick_4"
    t.string   "d_pick_4"
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

  create_table "series", force: true do |t|
    t.string   "series_id"
    t.string   "series_type"
    t.text     "matches"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
