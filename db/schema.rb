# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_05_151849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_credentials", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["user_id"], name: "index_api_credentials_on_user_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_buildings_on_user_id"
  end

  create_table "emitters", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_emitters_on_user_id"
  end

  create_table "event_conditions", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "sensor_id", null: false
    t.boolean "state"
    t.boolean "trigger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_conditions_on_event_id"
    t.index ["sensor_id"], name: "index_event_conditions_on_sensor_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.bigint "notification_setting_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_setting_id"], name: "index_events_on_notification_setting_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "notification_settings", force: :cascade do |t|
    t.boolean "active"
    t.time "start_time"
    t.time "end_time"
    t.integer "cooldown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_send_at"
    t.string "chat_id"
    t.string "message"
  end

  create_table "sensors", force: :cascade do |t|
    t.integer "building_id"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "mac"
    t.bigint "user_id"
    t.bigint "emitter_id"
    t.string "pin"
    t.bigint "notification_setting_id"
    t.index ["building_id"], name: "index_sensors_on_building_id"
    t.index ["emitter_id"], name: "index_sensors_on_emitter_id"
    t.index ["notification_setting_id"], name: "index_sensors_on_notification_setting_id"
    t.index ["user_id"], name: "index_sensors_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "setting_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["setting_id"], name: "index_users_on_setting_id"
  end

  add_foreign_key "api_credentials", "users"
  add_foreign_key "buildings", "users"
  add_foreign_key "emitters", "users"
  add_foreign_key "event_conditions", "events"
  add_foreign_key "event_conditions", "sensors"
  add_foreign_key "events", "notification_settings"
  add_foreign_key "events", "users"
  add_foreign_key "sensors", "buildings"
  add_foreign_key "sensors", "emitters"
  add_foreign_key "sensors", "notification_settings"
  add_foreign_key "sensors", "users"
  add_foreign_key "settings", "users"
  add_foreign_key "users", "settings"
end
