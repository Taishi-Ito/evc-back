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

ActiveRecord::Schema.define(version: 2022_09_04_021359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "capital_investments", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "title"
    t.string "unit"
    t.integer "fixed"
    t.string "created_by"
    t.string "edited_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_capital_investments_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "work_group_id"
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["work_group_id"], name: "index_projects_on_work_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "locale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_groups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_work_groups_on_user_id"
  end

  add_foreign_key "capital_investments", "projects"
  add_foreign_key "work_groups", "users"
end
