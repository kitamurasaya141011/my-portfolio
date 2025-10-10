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

ActiveRecord::Schema[8.0].define(version: 2025_10_09_063940) do
  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "employee_number", null: false
    t.integer "years_of_service", null: false
    t.date "date_of_hire", null: false
    t.date "date_of_retirement"
    t.string "previous_job"
    t.string "education", null: false
    t.boolean "is_on_leave", default: false, null: false
    t.bigint "employment_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employment_type_id"], name: "index_admins_on_employment_type_id"
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "faculty_id", null: false
    t.string "name", null: false
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id", "name"], name: "index_departments_on_faculty_id_and_name", unique: true
    t.index ["faculty_id"], name: "index_departments_on_faculty_id"
    t.index ["name"], name: "index_departments_on_name"
  end

  create_table "employment_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_faculties_on_name", unique: true
  end

  create_table "leaves", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_leaves_on_user_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "student_affiliations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "department_id", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_student_affiliations_on_department_id"
    t.index ["student_id", "department_id", "start_date"], name: "idx_on_student_id_department_id_start_date_78313ce6e3", unique: true
    t.index ["student_id"], name: "index_student_affiliations_on_student_id"
  end

  create_table "students", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "student_number", null: false
    t.integer "grade_level", null: false
    t.string "parent_name", null: false
    t.string "relationship", null: false
    t.date "date_of_admission", null: false
    t.date "date_of_separation"
    t.boolean "is_graduated", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teachers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "faculty_name", null: false
    t.string "department_name", null: false
    t.string "employee_number", null: false
    t.integer "years_of_service", null: false
    t.date "date_of_hire", null: false
    t.string "previous_job"
    t.string "education", null: false
    t.string "employment_type", null: false
    t.boolean "is_on_leave", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "gender", default: 0, null: false
    t.string "phone_mobile", null: false
    t.string "phone_emergency", null: false
    t.string "phone_home", null: false
    t.string "emergency_contact_name", null: false
    t.string "emergency_contact_relationship", null: false
    t.string "address", null: false
    t.date "date_of_birth", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "admins", "employment_types"
  add_foreign_key "admins", "users"
  add_foreign_key "departments", "faculties"
  add_foreign_key "leaves", "users"
  add_foreign_key "student_affiliations", "departments"
  add_foreign_key "student_affiliations", "students"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "users"
  add_foreign_key "users", "roles"
end
