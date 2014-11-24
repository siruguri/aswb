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

ActiveRecord::Schema.define(version: 20141124221227) do

  create_table "changes", force: true do |t|
    t.text     "changed_val"
    t.string   "changed_by"
    t.string   "changed_key"
    t.string   "change_type"
    t.integer  "jurisdiction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "practice_info_id"
    t.boolean  "confirmed"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "change_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["change_id"], name: "index_comments_on_change_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "jurisdictions", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.text     "exempted_groups"
    t.text     "ce_requirements_info"
    t.text     "definitions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
    t.string   "website"
    t.integer  "owner_id"
  end

  create_table "licensed_practices", force: true do |t|
    t.integer  "jurisdiction_id"
    t.integer  "practice_info_id"
    t.text     "education_experiences"
    t.text     "supervised_experiences"
    t.string   "exam_required"
    t.boolean  "board_approval"
    t.integer  "renewal_period_in_years"
    t.integer  "ce_in_hours"
    t.text     "special_ce_requirements"
    t.boolean  "provision_or_temp"
    t.string   "inactive_or_retired"
    t.float    "application_fee"
    t.text     "fees"
    t.integer  "renewal_schedule_in_years"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "navbar_entries", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.text     "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

  create_table "practice_infos", force: true do |t|
    t.string   "title"
    t.string   "initials"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "admin"
    t.integer  "age"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
