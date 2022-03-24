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

ActiveRecord::Schema.define(version: 2022_03_24_165652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme_id"], name: "index_chapters_on_theme_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_courses_on_chapter_id"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "session_id"
    t.bigint "user_id"
    t.index ["session_id"], name: "index_groups_on_session_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "subscription_date"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "question_answers", force: :cascade do |t|
    t.string "question"
    t.string "correct_answer"
    t.bigint "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_question_answers_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_quizzes_on_course_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "theme_id"
    t.index ["theme_id"], name: "index_sessions_on_theme_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_theme_session_chapter_courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_theme_session_chapters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_theme_session_id"
    t.integer "completion_rate"
    t.index ["user_theme_session_id"], name: "index_user_theme_session_chapters_on_user_theme_session_id"
  end

  create_table "user_theme_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "session_id"
    t.integer "completion_rate"
    t.index ["session_id"], name: "index_user_theme_sessions_on_session_id"
    t.index ["user_id"], name: "index_user_theme_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.bigint "user_id"
    t.index ["group_id"], name: "index_users_groups_on_group_id"
    t.index ["user_id"], name: "index_users_groups_on_user_id"
  end

  add_foreign_key "groups", "sessions"
  add_foreign_key "groups", "users"
  add_foreign_key "memberships", "users"
  add_foreign_key "sessions", "themes"
  add_foreign_key "user_theme_session_chapters", "user_theme_sessions"
  add_foreign_key "user_theme_sessions", "sessions"
  add_foreign_key "user_theme_sessions", "users"
  add_foreign_key "users_groups", "groups"
  add_foreign_key "users_groups", "users"
end
