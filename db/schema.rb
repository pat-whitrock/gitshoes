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

ActiveRecord::Schema.define(version: 20140422162215) do

  create_table "issues", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repo_id"
  end

  create_table "repos", force: true do |t|
    t.string   "address"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "language"
    t.integer  "open_issue_count"
    t.datetime "github_created_at"
    t.datetime "github_updated_at"
    t.string   "full_name"
  end

  create_table "user_repos", force: true do |t|
    t.integer  "user_id"
    t.integer  "repo_id"
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
    t.string   "provider"
    t.string   "token"
    t.string   "name"
    t.string   "github_login"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "widgets", force: true do |t|
    t.string   "color"
    t.string   "tab_font_color"
    t.string   "body_font_color"
    t.string   "background_color"
    t.string   "tab_font"
    t.string   "tab_font_size"
    t.string   "tab_text"
    t.string   "tab_width"
    t.string   "tab_height"
    t.string   "tab_edge_radius"
    t.string   "field_font"
    t.string   "field_font_size"
    t.string   "title_field_text"
    t.string   "description_field_text"
    t.string   "button_font"
    t.string   "button_font_size"
    t.string   "button_text"
    t.string   "form_width"
    t.string   "form_border_thickness"
    t.string   "form_border_type"
    t.string   "form_border_color"
    t.string   "form_border_radius"
    t.string   "orientation"
    t.string   "offset"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repo_id"
    t.string   "position"
    t.string   "edge"
    t.string   "tab_background_color"
    t.string   "body_font_size"
    t.string   "body_font"
    t.string   "tab_text_align"
    t.string   "tab_margin"
    t.string   "tab_padding"
    t.string   "tab_line_height"
    t.string   "tab_cursor"
    t.string   "tab_display"
    t.string   "button_success_text"
    t.string   "button_color"
    t.string   "button_background_color"
    t.string   "form_background_color"
  end

end
