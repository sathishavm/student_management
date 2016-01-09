# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160108155739) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "training_class_id", limit: 4
    t.string   "title",             limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "assignments", ["training_class_id"], name: "index_assignments_on_training_class_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students_training_classes", force: :cascade do |t|
    t.integer  "student_id",        limit: 4
    t.integer  "training_class_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "students_training_classes", ["student_id"], name: "index_students_training_classes_on_student_id", using: :btree
  add_index "students_training_classes", ["training_class_id"], name: "index_students_training_classes_on_training_class_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.integer  "student_id",    limit: 4
    t.integer  "assignment_id", limit: 4
    t.text     "result",        limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "submissions", ["assignment_id"], name: "index_submissions_on_assignment_id", using: :btree
  add_index "submissions", ["student_id"], name: "index_submissions_on_student_id", using: :btree

  create_table "training_classes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
