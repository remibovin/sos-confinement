# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_25_204825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.bigint "doctor_id"
    t.string "status", default: "", null: false
    t.integer "date_start_year", default: 0, null: false
    t.integer "date_start_month", default: 0, null: false
    t.integer "date_start_day", default: 0, null: false
    t.integer "time_start_hour", default: 0, null: false
    t.integer "time_start_minutes", default: 0, null: false
    t.integer "date_end_year", default: 0, null: false
    t.integer "date_end_month", default: 0, null: false
    t.integer "date_end_day", default: 0, null: false
    t.integer "time_end_hour", default: 0, null: false
    t.integer "time_end_minutes", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_availabilities_on_doctor_id"
  end

  create_table "consultations", force: :cascade do |t|
    t.bigint "availability_id"
    t.bigint "user_id"
    t.string "status", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["availability_id"], name: "index_consultations_on_availability_id"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "specialty", default: "", null: false
    t.string "adeli_number", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "status", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "availabilities", "doctors"
  add_foreign_key "consultations", "availabilities"
  add_foreign_key "consultations", "users"
end
