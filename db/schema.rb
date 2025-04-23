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

ActiveRecord::Schema[8.0].define(version: 2025_04_22_085833) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "actual_value_records", force: :cascade do |t|
    t.bigint "habit_id", null: false
    t.date "date"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habit_id"], name: "index_actual_value_records_on_habit_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "name"
    t.decimal "goal_value"
    t.string "unit"
    t.decimal "actual_value"
    t.string "goal_type"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "period"
    t.decimal "current_value"
    t.date "last_increment_date"
  end

  create_table "progress_records", force: :cascade do |t|
    t.integer "habit_id", null: false
    t.date "date"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habit_id"], name: "index_progress_records_on_habit_id"
  end

  add_foreign_key "actual_value_records", "habits"
  add_foreign_key "progress_records", "habits"
end
