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

ActiveRecord::Schema[7.0].define(version: 2023_06_20_064201) do
  create_table "daily_statuses", force: :cascade do |t|
    t.string "value"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_usages", force: :cascade do |t|
    t.integer "monthly_usage_id", null: false
    t.integer "daily_status_id"
    t.decimal "total_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["daily_status_id"], name: "index_daily_usages_on_daily_status_id"
    t.index ["monthly_usage_id"], name: "index_daily_usages_on_monthly_usage_id"
  end

  create_table "expense_items", force: :cascade do |t|
    t.integer "daily_usage_id", null: false
    t.integer "spending_type_id", null: false
    t.string "expense_item"
    t.decimal "amount"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_usage_id"], name: "index_expense_items_on_daily_usage_id"
    t.index ["spending_type_id"], name: "index_expense_items_on_spending_type_id"
  end

  create_table "monthly_usages", force: :cascade do |t|
    t.integer "yearly_usage_id", null: false
    t.integer "month_id", null: false
    t.decimal "total_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_monthly_usages_on_month_id"
    t.index ["yearly_usage_id"], name: "index_monthly_usages_on_yearly_usage_id"
  end

  create_table "months", force: :cascade do |t|
    t.string "value"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spending_types", force: :cascade do |t|
    t.string "value"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yearly_usages", force: :cascade do |t|
    t.integer "year"
    t.decimal "total_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "daily_usages", "daily_statuses"
  add_foreign_key "daily_usages", "monthly_usages"
  add_foreign_key "expense_items", "daily_usages"
  add_foreign_key "expense_items", "spending_types"
  add_foreign_key "monthly_usages", "months"
  add_foreign_key "monthly_usages", "yearly_usages"
end
