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

ActiveRecord::Schema.define(version: 20170423223957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "copier_requests", force: :cascade do |t|
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "req_name"
    t.string   "user_name"
    t.string   "user_phone"
    t.string   "user_email"
    t.string   "req_oem"
    t.string   "req_marketer"
    t.string   "req_embedded_platform"
    t.string   "req_general_notes"
    t.string   "req_aka"
    t.datetime "req_intro_date"
    t.datetime "req_disc_date"
    t.boolean  "req_print"
    t.boolean  "req_copy"
    t.boolean  "req_scan"
    t.boolean  "req_fax"
    t.boolean  "req_card_reader_support"
    t.string   "req_oem_vending_harness_01"
    t.string   "req_acdi_vending_harness_01"
    t.text     "req_pcb_details_01"
    t.string   "req_acdi_vending_harness_02"
    t.string   "req_oem_vending_harness_02"
    t.text     "req_pcb_details_02"
    t.string   "req_name_details"
    t.string   "req_model_type"
    t.string   "req_manufacturing_status"
    t.string   "req_print_speed"
    t.string   "req_supported_name"
    t.string   "req_supported_notes_01"
    t.string   "req_supported_notes_02"
    t.string   "req_manufacturer"
    t.string   "req_supported_status"
    t.string   "copr_id"
    t.boolean  "req_approved_status",         default: false
  end

  create_table "copiers", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "marketer"
    t.string   "embedded_platform"
    t.string   "general_notes"
    t.string   "aka"
    t.datetime "intro_date"
    t.datetime "disc_date"
    t.boolean  "print"
    t.boolean  "copy"
    t.boolean  "scan"
    t.boolean  "fax"
    t.string   "name"
    t.string   "oem"
    t.boolean  "card_reader_support"
    t.string   "oem_vending_harness_01"
    t.string   "old_db_id"
    t.string   "acdi_vending_harness_01"
    t.text     "pcb_details_01"
    t.string   "acdi_vending_harness_02"
    t.string   "oem_vending_harness_02"
    t.text     "pcb_details_02"
    t.string   "name_details"
    t.string   "model_type"
    t.string   "manufacturing_status"
    t.string   "print_speed"
    t.string   "supported_name"
    t.string   "supported_notes_01"
    t.string   "supported_notes_02"
    t.string   "manufacturer"
    t.string   "supported_status"
  end

  create_table "harnesses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matrix_mfds", force: :cascade do |t|
    t.string   "oem"
    t.string   "integrated_scanning"
    t.string   "supported_card_readers"
    t.string   "supported_related_brands"
    t.string   "solution_type"
    t.string   "zero_stop"
    t.string   "restrict_color_copying"
    t.string   "enforced_login_workflow"
    t.string   "shared_account_selection_list"
    t.string   "shared_account_keyword_search"
    t.string   "shared_account_selection_code"
    t.string   "shared_account_invoicing"
    t.string   "customizable_logos"
    t.string   "track_faxing"
    t.string   "track_usb_printing"
    t.string   "track_scanning"
    t.string   "auto_populate_email_scanning_to"
    t.string   "auto_populate_email_scanning_from"
    t.string   "fine_system_access_control"
    t.string   "secure_print_release"
    t.string   "release_jobs_on_login"
    t.string   "release_jobs_from_list"
    t.string   "block_jobs_printer_error"
    t.string   "user_auth_at_device"
    t.string   "username_and_password_auth"
    t.string   "id_only_auth"
    t.string   "id_pin_auth"
    t.string   "card_only_auth"
    t.string   "card_pin_auth"
    t.string   "self_association_cards"
    t.string   "set_pin_first_login"
    t.string   "single_sign_on"
    t.string   "swipe_log_out"
    t.string   "offline_mode"
    t.string   "extra_license_requirements"
    t.string   "assisted_setup"
    t.string   "security_rating"
    t.string   "install_time"
    t.string   "supported_server_os"
    t.string   "character_sets_supported"
    t.string   "guest_access"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "oems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "vendor_harnesses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
