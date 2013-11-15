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

ActiveRecord::Schema.define(version: 20131113150646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "casts", force: true do |t|
    t.integer  "movie_id"
    t.integer  "person_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "casts", ["movie_id"], name: "index_casts_on_movie_id", using: :btree
  add_index "casts", ["person_id"], name: "index_casts_on_person_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "author"
    t.text     "body"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["movie_id"], name: "index_comments_on_movie_id", using: :btree

  create_table "movies", force: true do |t|
    t.string   "title"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "synopsis"
    t.integer  "year"
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
