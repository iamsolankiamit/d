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

ActiveRecord::Schema.define(version: 20160224060905) do

  create_table "active_admin_comments", force: :cascade do |t|
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

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "designs", force: :cascade do |t|
    t.boolean  "slider"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "ticker_text"
    t.boolean  "ticker"
    t.string   "layout_type"
  end

  create_table "displays", force: :cascade do |t|
    t.text     "margue"
    t.string   "left_photo_file_name"
    t.string   "left_photo_content_type"
    t.integer  "left_photo_file_size"
    t.datetime "left_photo_updated_at"
    t.string   "right_photo_file_name"
    t.string   "right_photo_content_type"
    t.integer  "right_photo_file_size"
    t.datetime "right_photo_updated_at"
    t.string   "bottom_photo_file_name"
    t.string   "bottom_photo_content_type"
    t.integer  "bottom_photo_file_size"
    t.datetime "bottom_photo_updated_at"
    t.string   "signage_video_file_name"
    t.string   "signage_video_content_type"
    t.integer  "signage_video_file_size"
    t.datetime "signage_video_updated_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "version"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "playlist_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "version"
    t.integer  "count",       default: 0
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "design_id"
  end

  add_index "photos", ["design_id"], name: "index_photos_on_design_id"

  create_table "pis", force: :cascade do |t|
    t.string   "name"
    t.integer  "uid"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "design_id"
    t.integer  "version",    default: 0
  end

  add_index "playlists", ["design_id"], name: "index_playlists_on_design_id"

  create_table "sliders", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "uploaders", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "movie_file_name"
    t.string   "movie_content_type"
    t.integer  "movie_file_size"
    t.datetime "movie_updated_at"
    t.integer  "playlist_id"
  end

  add_index "videos", ["playlist_id"], name: "index_videos_on_playlist_id"

end
