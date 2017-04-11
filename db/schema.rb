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

ActiveRecord::Schema.define(version: 20151231140638) do

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "type"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["provider"], name: "index_accounts_on_provider"
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  add_index "accounts", ["uid"], name: "index_accounts_on_uid"

  create_table "answers", force: :cascade do |t|
    t.string   "text"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lawyer_id"
    t.text     "description"
    t.string   "voice"
  end

  add_index "answers", ["lawyer_id"], name: "index_answers_on_lawyer_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image"
    t.string   "video_field"
    t.boolean  "video",            default: false
    t.text     "about"
    t.string   "image_body_field"
    t.boolean  "image_body_boo"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "attorney_profiles", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "firm_name"
    t.string   "firm_address"
    t.string   "office_phone"
    t.string   "licensed_since"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "law_categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lawyer_profiles", force: :cascade do |t|
    t.text     "name"
    t.string   "address"
    t.text     "state"
    t.text     "body"
    t.text     "practices"
    t.text     "license"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lawyer_id"
    t.string   "image"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "attorney_id"
  end

  add_index "lawyer_profiles", ["lawyer_id"], name: "index_lawyer_profiles_on_lawyer_id"

  create_table "lawyers", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "validated",              default: false
  end

  add_index "lawyers", ["email"], name: "index_lawyers_on_email", unique: true
  add_index "lawyers", ["reset_password_token"], name: "index_lawyers_on_reset_password_token", unique: true

  create_table "practice_areas", force: :cascade do |t|
    t.integer  "attorney_profile_id"
    t.integer  "law_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "practice_areas", ["attorney_profile_id"], name: "index_practice_areas_on_attorney_profile_id"
  add_index "practice_areas", ["law_category_id"], name: "index_practice_areas_on_law_category_id"

  create_table "questions", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "ipaddress"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
