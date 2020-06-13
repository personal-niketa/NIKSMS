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

ActiveRecord::Schema.define(version: 2020_06_13_162436) do

  create_table "admissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "student_id"
    t.bigint "class_section_id"
    t.integer "roll_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "admission_number"
    t.index ["batch_id"], name: "index_admissions_on_batch_id"
    t.index ["class_section_id"], name: "index_admissions_on_class_section_id"
    t.index ["student_id"], name: "index_admissions_on_student_id"
  end

  create_table "batches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "batch_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_sections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "section_name"
    t.text "description"
    t.bigint "school_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacity", default: 0
    t.index ["school_class_id"], name: "index_class_sections_on_school_class_id"
  end

  create_table "class_teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "class_section_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_class_teachers_on_batch_id"
    t.index ["class_section_id"], name: "index_class_teachers_on_class_section_id"
    t.index ["user_id"], name: "index_class_teachers_on_user_id"
  end

  create_table "exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "school_class_id"
    t.text "subject"
    t.text "exam_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_exams_on_batch_id"
    t.index ["school_class_id"], name: "index_exams_on_school_class_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "school_classes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id"
    t.index ["school_id"], name: "index_school_classes_on_school_id"
  end

  create_table "schools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "school_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address"
    t.text "board"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.datetime "dob"
    t.text "gender"
    t.text "father_name"
    t.text "mother_name"
    t.text "contact_no"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "country"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "phone"
    t.bigint "school_id"
    t.text "first_name"
    t.text "last_name"
    t.text "details"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  create_table "users_roles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "admissions", "batches"
  add_foreign_key "admissions", "class_sections"
  add_foreign_key "admissions", "students"
  add_foreign_key "class_teachers", "batches"
  add_foreign_key "class_teachers", "class_sections"
  add_foreign_key "class_teachers", "users"
  add_foreign_key "exams", "batches"
  add_foreign_key "exams", "school_classes"
end
