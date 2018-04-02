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

ActiveRecord::Schema.define(version: 20180330061812) do

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact"
    t.string "email"
    t.integer "requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resume"
    t.index ["requirement_id"], name: "index_candidates_on_requirement_id"
  end

  create_table "dutables", force: :cascade do |t|
    t.string "du_name"
    t.integer "du_id_code"
    t.text "du_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "emp_firstname"
    t.string "emp_lastname"
    t.integer "emp_id"
    t.string "emp_designation"
    t.string "emp_skills"
    t.string "emp_mail"
    t.string "emp_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees_projects", id: false, force: :cascade do |t|
    t.integer "employee_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.integer "pro_idcode"
    t.text "pro_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dutable_id"
    t.index ["dutable_id"], name: "index_projects_on_dutable_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "position"
    t.string "skills"
    t.integer "experience"
    t.string "salary"
    t.string "qualification"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
