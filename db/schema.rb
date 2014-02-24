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

ActiveRecord::Schema.define(version: 20140224174912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keywords", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "impression_count", default: 0
    t.string   "result_type",      default: "mixed"
    t.integer  "rate",             default: 5
  end

  create_table "users", force: true do |t|
    t.string   "waitlist",    default: "true"
    t.string   "provider"
    t.integer  "uid"
    t.string   "name"
    t.string   "nickname"
    t.string   "location"
    t.string   "image"
    t.string   "description"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "roles",       default: "---\n- :regular_user\n"
  end

end
