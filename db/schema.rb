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

ActiveRecord::Schema.define(version: 20151216233746) do

  create_table "accounts", force: true do |t|
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

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "answers", force: true do |t|
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

  create_table "articles", force: true do |t|
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

  create_table "lawyer_profiles", force: true do |t|
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

  create_table "lawyers", force: true do |t|
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

  create_table "questions", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "ipaddress"
  end

  create_table "users", force: true do |t|
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
