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

ActiveRecord::Schema.define(version: 2021_02_22_213421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_items", force: :cascade do |t|
    t.bigint "panel_id", null: false
    t.text "description"
    t.boolean "completed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["panel_id"], name: "index_action_items_on_panel_id"
  end

  create_table "cases", force: :cascade do |t|
    t.string "candidate_fullname", null: false
    t.string "candidate_email", null: false
    t.datetime "due_date"
    t.bigint "institution_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "applicant_was_notified_at"
    t.index ["institution_id"], name: "index_cases_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "panel_members", force: :cascade do |t|
    t.bigint "panel_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["panel_id"], name: "index_panel_members_on_panel_id"
    t.index ["user_id"], name: "index_panel_members_on_user_id"
  end

  create_table "panel_recusals", force: :cascade do |t|
    t.bigint "panel_member_id", null: false
    t.bigint "case_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["case_id"], name: "index_panel_recusals_on_case_id"
    t.index ["panel_member_id"], name: "index_panel_recusals_on_panel_member_id"
  end

  create_table "panels", force: :cascade do |t|
    t.string "name", null: false
    t.integer "case_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "unique_identifier", null: false
    t.bigint "institution_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_users_on_institution_id"
  end

  create_table "work_step_panels", force: :cascade do |t|
    t.bigint "work_step_id", null: false
    t.bigint "panel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["panel_id"], name: "index_work_step_panels_on_panel_id"
    t.index ["work_step_id"], name: "index_work_step_panels_on_work_step_id"
  end

  create_table "work_steps", force: :cascade do |t|
    t.integer "step_number", null: false
    t.boolean "current", default: false
    t.bigint "case_id", null: false
    t.datetime "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["case_id"], name: "index_work_steps_on_case_id"
  end

  add_foreign_key "action_items", "panels"
  add_foreign_key "cases", "institutions"
  add_foreign_key "panel_members", "panels"
  add_foreign_key "panel_members", "users"
  add_foreign_key "panel_recusals", "cases"
  add_foreign_key "panel_recusals", "panel_members"
  add_foreign_key "panels", "cases"
  add_foreign_key "users", "institutions"
  add_foreign_key "work_step_panels", "panels"
  add_foreign_key "work_step_panels", "work_steps"
  add_foreign_key "work_steps", "cases"
end
