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

ActiveRecord::Schema.define(version: 20170308144923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "copier_requests", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "req_name"
    t.string   "user_name"
    t.string   "user_phone"
    t.string   "user_email"
    t.string   "req_oem"
    t.string   "req_marketer"
    t.boolean  "req_pc_embedded"
    t.string   "req_embedded_platform"
    t.boolean  "req_pc_int_scanning"
    t.boolean  "req_pc_dependency"
    t.string   "req_pc_dependency_detail"
    t.string   "req_general_notes"
    t.string   "req_aka"
    t.datetime "req_intro_date"
    t.datetime "req_disc_date"
    t.boolean  "req_print"
    t.boolean  "req_copy"
    t.boolean  "req_scan"
    t.boolean  "req_fax"
  end

  create_table "copiers", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "marketer"
    t.boolean  "pc_embedded"
    t.string   "embedded_platform"
    t.boolean  "pc_int_scanning"
    t.boolean  "pc_dependency"
    t.string   "pc_dependency_detail"
    t.string   "general_notes"
    t.string   "aka"
    t.datetime "intro_date"
    t.datetime "disc_date"
    t.boolean  "print"
    t.boolean  "copy"
    t.boolean  "scan"
    t.boolean  "fax"
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
