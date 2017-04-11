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

ActiveRecord::Schema.define(version: 20170408101729) do

  create_table "battles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "applicant_id",  null: false
    t.integer  "authorizer_id", null: false
    t.integer  "result"
    t.datetime "getup",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["applicant_id"], name: "index_battles_on_applicant_id", using: :btree
    t.index ["authorizer_id"], name: "index_battles_on_authorizer_id", using: :btree
    t.index ["getup"], name: "getup_index", using: :btree
  end

  create_table "recruits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "applicant_id",  null: false
    t.integer  "authorizer_id"
    t.datetime "getup",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["applicant_id"], name: "applicant_id_index", unique: true, using: :btree
    t.index ["applicant_id"], name: "index_recruits_on_applicant_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "password",   null: false
    t.integer  "win"
    t.integer  "lose"
    t.integer  "draw"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "name_index", unique: true, using: :btree
  end

  add_foreign_key "battles", "users", column: "applicant_id"
  add_foreign_key "battles", "users", column: "authorizer_id"
  add_foreign_key "recruits", "users", column: "applicant_id"
end
