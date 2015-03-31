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

ActiveRecord::Schema.define(version: 20150331150740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actuals", force: :cascade do |t|
    t.date     "period"
    t.decimal  "costs",              precision: 16, scale: 2
    t.decimal  "revenue",            precision: 16, scale: 2
    t.decimal  "capital_introduced", precision: 16, scale: 2
    t.string   "capital_note"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "features", force: :cascade do |t|
    t.string   "name",                  null: false
    t.integer  "effort"
    t.date     "development_start"
    t.float    "development_headcount"
    t.date     "release_date"
    t.integer  "development_periods"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "features", ["name"], name: "index_features_on_name", unique: true, using: :btree

  create_table "segment_features", force: :cascade do |t|
    t.integer  "segment_id"
    t.integer  "feature_id"
    t.float    "obtainable_market"
    t.decimal  "obtainable_revenue", precision: 16, scale: 2
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "segment_name",                                null: false
    t.string   "feature_name",                                null: false
  end

  add_index "segment_features", ["feature_id"], name: "index_segment_features_on_feature_id", using: :btree
  add_index "segment_features", ["segment_id"], name: "index_segment_features_on_segment_id", using: :btree

  create_table "segments", force: :cascade do |t|
    t.string   "name"
    t.integer  "addressable_market"
    t.float    "market_expansion"
    t.float    "awareness_coefficient"
    t.float    "adoption_coefficient"
    t.float    "adoption_peak"
    t.float    "conversion_uc"
    t.float    "conversion_ua"
    t.float    "conversion_ca"
    t.float    "stickiness"
    t.decimal  "available_revenue",     precision: 16, scale: 2
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "segment_features", "features"
  add_foreign_key "segment_features", "segments"
end
