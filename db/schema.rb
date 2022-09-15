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

ActiveRecord::Schema.define(version: 2022_09_15_005132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bst_records", force: :cascade do |t|
    t.bigint "bst_id", null: false
    t.integer "year"
    t.integer "month"
    t.decimal "cash", precision: 19, scale: 3
    t.decimal "accounts_receivable", precision: 19, scale: 3
    t.decimal "ar_sales_ratio", precision: 6, scale: 3
    t.decimal "merchandise_other", precision: 19, scale: 3
    t.decimal "mo_sales_ratio", precision: 6, scale: 3
    t.decimal "investment_other", precision: 19, scale: 3
    t.decimal "accounts_payable", precision: 19, scale: 3
    t.decimal "cost_ratio", precision: 6, scale: 3
    t.decimal "cd_other", precision: 19, scale: 3
    t.decimal "long_term_debt", precision: 19, scale: 3
    t.decimal "fl_other", precision: 19, scale: 3
    t.decimal "capital", precision: 19, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bst_id"], name: "index_bst_records_on_bst_id"
  end

  create_table "bsts", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "sequence"
    t.string "title"
    t.string "unit"
    t.integer "fixed"
    t.string "created_by"
    t.string "edited_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_bsts_on_project_id"
  end

  create_table "capital_investment_records", force: :cascade do |t|
    t.bigint "capital_investment_id", null: false
    t.integer "year"
    t.integer "month"
    t.decimal "existing_facilities", precision: 19, scale: 3
    t.decimal "new_facilities", precision: 19, scale: 3
    t.decimal "d_existing_facilities", precision: 19, scale: 3
    t.decimal "d_new_facilities", precision: 19, scale: 3
    t.integer "d_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["capital_investment_id"], name: "index_capital_investment_records_on_capital_investment_id"
  end

  create_table "capital_investments", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "title"
    t.string "unit"
    t.integer "fixed"
    t.string "created_by"
    t.string "edited_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "sequence"
    t.index ["project_id"], name: "index_capital_investments_on_project_id"
  end

  create_table "pl_records", force: :cascade do |t|
    t.bigint "pl_id", null: false
    t.integer "year"
    t.integer "month"
    t.decimal "customer", precision: 19, scale: 3
    t.decimal "av_customer_spend", precision: 19, scale: 3
    t.decimal "sales_cost", precision: 19, scale: 3
    t.decimal "sales_cost_ratio", precision: 6, scale: 3
    t.decimal "labor_cost", precision: 19, scale: 3
    t.decimal "cost_other", precision: 19, scale: 3
    t.decimal "no_op_income", precision: 19, scale: 3
    t.decimal "interest_expense", precision: 19, scale: 3
    t.decimal "interest_rate", precision: 6, scale: 3
    t.decimal "other", precision: 19, scale: 3
    t.decimal "tax", precision: 19, scale: 3
    t.decimal "tax_rate", precision: 6, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pl_id"], name: "index_pl_records_on_pl_id"
  end

  create_table "pls", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.text "sequence"
    t.string "title"
    t.string "unit"
    t.integer "fixed"
    t.string "created_by"
    t.string "edited_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_pls_on_project_id"
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

  add_foreign_key "bst_records", "bsts"
  add_foreign_key "bsts", "projects"
  add_foreign_key "capital_investment_records", "capital_investments"
  add_foreign_key "capital_investments", "projects"
  add_foreign_key "pl_records", "pls"
  add_foreign_key "pls", "projects"
  add_foreign_key "work_groups", "users"
end
