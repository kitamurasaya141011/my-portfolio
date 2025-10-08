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

ActiveRecord::Schema[8.0].define(version: 2025_10_08_074310) do
  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "employee_number"
    t.integer "years_of_service"
    t.date "date_of_hire"
    t.string "previous_job"
    t.string "education"
    t.boolean "is_on_leave", default: false
    t.string "employment_type", default: "正社員", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "students", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "student_number"
    t.string "faculty_name"
    t.string "department_name"
    t.integer "grade_level"
    t.string "parent_name"
    t.string "relationship"
    t.boolean "is_graduated"
    t.boolean "is_taking_a_break"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "faculty_name"
    t.string "department_name"
    t.string "employee_number"
    t.integer "years_of_service"
    t.date "date_of_hire"
    t.string "previous_job"
    t.string "education"
    t.string "employment_type"
    t.boolean "is_on_leave", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "email"
    t.string "password_digest"
    t.integer "gender", default: 0, null: false
    t.string "phone_mobile"
    t.string "phone_emergency"
    t.string "phone_home"
    t.string "emergency_contact_name"
    t.string "emergency_contact_relationship"
    t.string "address"
    t.date "date_of_birth"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "admins", "users"
  add_foreign_key "teachers", "users"
end
