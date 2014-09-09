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

ActiveRecord::Schema.define(version: 20140909234127) do

  create_table "bans", force: true do |t|
    t.integer  "order"
    t.integer  "match_id"
    t.integer  "hero_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "heros", force: true do |t|
    t.string   "hero_id"
    t.string   "name"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bans_count",  default: 0
    t.integer  "picks_count", default: 0
  end

  create_table "heros_users", force: true do |t|
    t.integer  "heros_id"
    t.integer  "users_id"
    t.string   "user_id"
    t.string   "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "item_id"
    t.string   "name"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_performances", id: false, force: true do |t|
    t.integer "items_id"
    t.integer "performances_id"
    t.integer "item_id"
    t.integer "performance_id"
  end

  create_table "matches", force: true do |t|
    t.string   "match_id"
    t.boolean  "radiant_win"
    t.string   "start_time"
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "series_id"
  end

  create_table "performances", force: true do |t|
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
    t.integer  "hero_id"
    t.integer  "player_id"
    t.integer  "match_id"
    t.boolean  "is_winner"
  end

  create_table "picks", force: true do |t|
    t.integer  "order"
    t.integer  "match_id"
    t.integer  "hero_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_roles", force: true do |t|
    t.string   "team_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
  end

  create_table "players", force: true do |t|
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", force: true do |t|
    t.string   "series_type"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bans_count",  default: 0
    t.integer  "picks_count", default: 0
    t.string   "team_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.integer  "mmr"
    t.string   "email"
    t.string   "provider"
    t.integer  "uid",           limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_pos"
    t.string   "second_pos"
    t.string   "steam_profile"
    t.string   "player_type"
  end

end
