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

ActiveRecord::Schema.define(version: 20170607022536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

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
    t.index ["email"], name: "index_accounts_on_email", unique: true, using: :btree
    t.index ["provider"], name: "index_accounts_on_provider", using: :btree
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
    t.index ["uid"], name: "index_accounts_on_uid", using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.string   "text"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lawyer_id"
    t.text     "description"
    t.string   "voice"
    t.index ["lawyer_id"], name: "index_answers_on_lawyer_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "video_field"
    t.text     "about"
    t.string   "image_body_field"
    t.integer  "law_category_id"
    t.string   "slug"
    t.integer  "attorney_id"
    t.text     "raw_body"
    t.tsvector "tsv_search"
    t.index ["law_category_id"], name: "index_articles_on_law_category_id", using: :btree
    t.index ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
    t.index ["tsv_search"], name: "index_articles_on_tsv_search", using: :gin
  end

  create_table "attorney_law_categories", force: :cascade do |t|
    t.integer  "attorney_id"
    t.integer  "law_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["attorney_id"], name: "index_attorney_law_categories_on_attorney_id", using: :btree
    t.index ["law_category_id"], name: "index_attorney_law_categories_on_law_category_id", using: :btree
  end

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

  create_table "attorneys", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "contact_email"
    t.string   "profile_photo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "firm_id"
    t.text     "description"
    t.index ["firm_id"], name: "index_attorneys_on_firm_id", using: :btree
  end

  create_table "firms", force: :cascade do |t|
    t.text     "description"
    t.string   "name"
    t.string   "logo"
    t.string   "address"
    t.string   "state"
    t.string   "office_phone"
    t.string   "website"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
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
    t.index ["lawyer_id"], name: "index_lawyer_profiles_on_lawyer_id", using: :btree
  end

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
    t.index ["email"], name: "index_lawyers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_lawyers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "practice_areas", force: :cascade do |t|
    t.integer  "attorney_profile_id"
    t.integer  "law_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["attorney_profile_id"], name: "index_practice_areas_on_attorney_profile_id", using: :btree
    t.index ["law_category_id"], name: "index_practice_areas_on_law_category_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "ipaddress"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
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
    t.string   "type"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
