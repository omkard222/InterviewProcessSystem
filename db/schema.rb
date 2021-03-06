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

ActiveRecord::Schema.define(version: 20180508065911) do

  create_table "candidates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact"
    t.string "email"
    t.bigint "requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resume"
    t.index ["requirement_id"], name: "index_candidates_on_requirement_id"
  end

  create_table "dutables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "du_name"
    t.text "du_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_requirement_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "employee_requirement_skillable_id"
    t.string "employee_requirement_skillable_type"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "emp_firstname"
    t.string "emp_lastname"
    t.integer "emp_id"
    t.string "emp_designation"
    t.string "emp_mail"
    t.string "emp_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees_projects", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "employee_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "stage_name"
    t.string "status"
    t.string "duration_of_interview"
    t.string "comments"
    t.string "communication"
    t.string "attitude"
    t.string "learning_capabilties"
    t.string "Tech_analysis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "scheduler_id"
    t.bigint "candidate_id"
    t.string "opportunityID"
    t.string "round_type"
    t.index ["candidate_id"], name: "index_feedbacks_on_candidate_id"
    t.index ["scheduler_id"], name: "index_feedbacks_on_scheduler_id"
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "project_name"
    t.text "pro_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dutable_id"
    t.bigint "user_id"
    t.index ["dutable_id"], name: "index_projects_on_dutable_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "requirements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "position"
    t.string "skills"
    t.integer "experience"
    t.string "qualification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.string "description"
    t.string "opportunityID"
    t.string "job_description"
    t.string "job_summary"
    t.string "status", default: "open"
    t.index ["project_id"], name: "index_requirements_on_project_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "schedulers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "interview_date"
    t.bigint "candidate_id"
    t.bigint "requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "start_time"
    t.string "end_time"
    t.bigint "user_id"
    t.index ["candidate_id"], name: "index_schedulers_on_candidate_id"
    t.index ["requirement_id"], name: "index_schedulers_on_requirement_id"
    t.index ["user_id"], name: "index_schedulers_on_user_id"
  end

  create_table "skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string "name"
    t.integer "employee_id"
    t.string "designation"
    t.string "phone_no"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "candidates", "requirements"
  add_foreign_key "feedbacks", "candidates"
  add_foreign_key "feedbacks", "schedulers"
  add_foreign_key "projects", "dutables"
  add_foreign_key "projects", "users"
  add_foreign_key "requirements", "projects"
  add_foreign_key "schedulers", "candidates"
  add_foreign_key "schedulers", "requirements"
  add_foreign_key "schedulers", "users"
end
