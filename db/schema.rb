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

ActiveRecord::Schema.define(version: 20170329101746) do

  create_table "battles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "applicant",  null: false
    t.integer  "authorizer", null: false
    t.boolean  "condition"
    t.boolean  "flag"
    t.integer  "result"
    t.string   "getup",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant"], name: "applicant_index", using: :btree
    t.index ["authorizer"], name: "authorizor_index", using: :btree
    t.index ["getup"], name: "getup_index", using: :btree
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

end
