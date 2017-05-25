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

ActiveRecord::Schema.define(version: 20170525221504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nd_wells", force: :cascade do |t|
    t.bigint "api_no"
    t.integer "file_no"
    t.string "current_operator"
    t.string "current_well_name"
    t.string "lease_name"
    t.string "lease_number"
    t.string "original_operator"
    t.string "original_well_name"
    t.date "spud_date"
    t.integer "td"
    t.string "county_name"
    t.string "township"
    t.string "range"
    t.integer "section"
    t.string "qq"
    t.string "footages"
    t.string "field_name"
    t.string "produced_pools"
    t.string "oil_water_gas_cums"
    t.string "ipt_date_oil_water_gas"
    t.string "wellbore"
    t.float "latitude"
    t.float "longitude"
    t.string "well_type"
    t.string "well_status"
    t.string "ctb"
    t.date "well_status_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
