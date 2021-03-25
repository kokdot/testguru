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

ActiveRecord::Schema.define(version: 2021_03_25_054559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "body", null: false
    t.boolean "correct", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "bages", force: :cascade do |t|
    t.string "url_picture"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bages_rules", force: :cascade do |t|
    t.string "title"
    t.bigint "bage_id"
    t.bigint "condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bage_id"], name: "index_bages_rules_on_bage_id"
    t.index ["condition_id"], name: "index_bages_rules_on_condition_id"
  end

  create_table "bages_users", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "user_id"
    t.bigint "bages_rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bages_rule_id"], name: "index_bages_users_on_bages_rule_id"
    t.index ["test_id"], name: "index_bages_users_on_test_id"
    t.index ["user_id"], name: "index_bages_users_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gists", force: :cascade do |t|
    t.string "url"
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_gists_on_question_id"
    t.index ["user_id"], name: "index_gists_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "test_id"
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "test_passages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "test_id"
    t.integer "question_id"
    t.integer "correct_questions", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "success", default: false
    t.index ["question_id"], name: "index_test_passages_on_question_id"
    t.index ["test_id"], name: "index_test_passages_on_test_id"
    t.index ["user_id"], name: "index_test_passages_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "user_id"
    t.index ["category_id"], name: "index_tests_on_category_id"
    t.index ["title", "level"], name: "index_tests_on_title_and_level", unique: true
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "type", default: "User", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["type"], name: "index_users_on_type"
  end

  add_foreign_key "bages_rules", "bages"
  add_foreign_key "bages_rules", "conditions"
  add_foreign_key "bages_users", "bages_rules"
  add_foreign_key "bages_users", "tests"
  add_foreign_key "bages_users", "users"
end
