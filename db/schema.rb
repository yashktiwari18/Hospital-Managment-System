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

ActiveRecord::Schema[8.1].define(version: 2026_06_05_055210) do
  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "doctor_id", null: false
    t.integer "patient_id", null: false
    t.string "status"
    t.time "time"
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "bills", force: :cascade do |t|
    t.decimal "amount"
    t.integer "appointment_id", null: false
    t.datetime "created_at", null: false
    t.integer "doctor_id"
    t.integer "patient_id"
    t.string "payment_method"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_bills_on_appointment_id"
    t.index ["doctor_id"], name: "index_bills_on_doctor_id"
    t.index ["patient_id"], name: "index_bills_on_patient_id"
  end

  create_table "doctor_schedules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "day"
    t.integer "doctor_id", null: false
    t.time "end_time"
    t.time "start_time"
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_schedules_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.text "about"
    t.text "address"
    t.integer "age"
    t.integer "consultation_fee"
    t.datetime "created_at", null: false
    t.string "department"
    t.string "education"
    t.integer "experience"
    t.string "field"
    t.string "gender"
    t.string "name"
    t.string "phone"
    t.string "qualification"
    t.string "specialization"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "medical_records", force: :cascade do |t|
    t.integer "appointment_id", null: false
    t.string "chief_complaint"
    t.datetime "created_at", null: false
    t.text "diagnosis"
    t.integer "doctor_id", null: false
    t.text "doctor_notes"
    t.date "follow_up_date"
    t.integer "patient_id", null: false
    t.text "prescription"
    t.text "symptoms"
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_medical_records_on_appointment_id"
    t.index ["doctor_id"], name: "index_medical_records_on_doctor_id"
    t.index ["patient_id"], name: "index_medical_records_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.text "address"
    t.integer "age"
    t.datetime "created_at", null: false
    t.string "gender"
    t.string "name"
    t.string "phone"
    t.integer "room_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["room_id"], name: "index_patients_on_room_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.boolean "availability"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.string "room_number"
    t.string "room_type"
    t.datetime "updated_at", null: false
  end

  create_table "test_reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "patient_id", null: false
    t.text "result"
    t.string "test_type"
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_test_reports_on_patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "password"
    t.string "password_digest"
    t.string "role"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "patients"
  add_foreign_key "bills", "appointments"
  add_foreign_key "bills", "doctors"
  add_foreign_key "bills", "patients"
  add_foreign_key "doctor_schedules", "doctors"
  add_foreign_key "doctors", "users"
  add_foreign_key "medical_records", "appointments"
  add_foreign_key "medical_records", "doctors"
  add_foreign_key "medical_records", "patients"
  add_foreign_key "patients", "rooms"
  add_foreign_key "patients", "users"
  add_foreign_key "test_reports", "patients"
end
