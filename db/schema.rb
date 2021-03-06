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

ActiveRecord::Schema.define(version: 20180219214520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "author_id"
    t.integer "group"
    t.integer "category", default: 0, null: false
    t.integer "level"
    t.integer "days"
    t.boolean "confirmed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_activities_on_author_id"
  end

  create_table "activity_attachments", id: :serial, force: :cascade do |t|
    t.string "handout"
    t.integer "activity_id"
  end

  create_table "editions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "edition_start"
    t.datetime "edition_end"
    t.datetime "recruitment_deadline"
    t.datetime "camp_start"
    t.datetime "camp_end"
    t.string "camp_place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean "all_day"
    t.text "description"
    t.string "color"
    t.string "category"
    t.boolean "locked", default: true
    t.integer "activity_id"
    t.integer "edition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_events_on_activity_id"
    t.index ["edition_id"], name: "index_events_on_edition_id"
  end

  create_table "feedbacks", id: :serial, force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.decimal "mark"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_feedbacks_on_event_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "sequences", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.datetime "sequence_start"
    t.datetime "sequence_end"
    t.integer "edition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edition_id"], name: "index_sequences_on_edition_id"
  end

  create_table "solutions", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.integer "task_id"
    t.text "answer"
    t.decimal "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_solutions_on_author_id"
    t.index ["task_id"], name: "index_solutions_on_task_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "sequence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sequence_id"], name: "index_tasks_on_sequence_id"
  end

  create_table "user_activities", id: :serial, force: :cascade do |t|
    t.integer "activity_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_user_activities_on_activity_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "user_editions", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "role"
    t.bigint "edition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edition_id"], name: "index_user_editions_on_edition_id"
    t.index ["user_id"], name: "index_user_editions_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "avatar", default: ""
    t.string "locale", default: ""
    t.integer "nationality"
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
