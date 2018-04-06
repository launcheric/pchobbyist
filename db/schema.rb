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

ActiveRecord::Schema.define(version: 20180405210759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "builds", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "computer_case_id", null: false
    t.integer "cpu_cooler_id"
    t.integer "cpu_id", null: false
    t.integer "motherboard_id", null: false
    t.integer "network_card_id"
    t.integer "power_supply_id", null: false
    t.integer "video_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.integer "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "build_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "computer_cases", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.string "case_type", null: false
    t.string "power_supply", null: false
    t.string "small_bay", null: false
    t.string "medium_bay", null: false
    t.string "compatibility", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cpu_coolers", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.string "supported_sockets", null: false
    t.string "liquid_cooler", null: false
    t.string "bearing_type"
    t.string "noise_level"
    t.string "fan_rpm"
    t.string "height"
    t.string "radiator_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cpus", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.string "data_width"
    t.string "socket", null: false
    t.string "operating_frequency", null: false
    t.string "max_turbo_frequency"
    t.string "cores", null: false
    t.string "lighography", null: false
    t.string "thermal_design_power", null: false
    t.string "cooler", null: false
    t.string "maximum_memory", null: false
    t.string "integrated_graphics", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hard_drives", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.string "hdd_type", null: false
    t.string "capacity", null: false
    t.string "interface", null: false
    t.string "cache", null: false
    t.string "rpm", null: false
    t.string "form_factor", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hd_counts", force: :cascade do |t|
    t.integer "hard_drive_id", null: false
    t.integer "build_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memory_cards", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.string "memory_type", null: false
    t.string "speed", null: false
    t.string "size", null: false
    t.string "cas_latency", null: false
    t.string "voltage", null: false
    t.string "ecc", null: false
    t.string "registered", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memory_counts", force: :cascade do |t|
    t.integer "memory_card_id", null: false
    t.integer "build_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motherboards", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.string "form_factor", null: false
    t.string "socket", null: false
    t.string "chipset", null: false
    t.string "memory_pin", null: false
    t.string "memory_slots", null: false
    t.string "memory_type", null: false
    t.string "maximum_memory", null: false
    t.string "raid_support", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "network_cards", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.string "interface", null: false
    t.string "protocols", null: false
    t.string "security", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "power_supplies", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.string "psu_type", null: false
    t.string "wattage", null: false
    t.string "modular", null: false
    t.string "efficiency_certification", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_cards", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.string "interface", null: false
    t.string "chipset", null: false
    t.string "memory_size", null: false
    t.string "memory_type", null: false
    t.string "core_clock", null: false
    t.string "boost_clock"
    t.string "thermal_design_power", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
