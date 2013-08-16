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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130815021208) do

  create_table "attachments", :force => true do |t|
    t.string   "media"
    t.string   "content_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.integer  "attachmentable_id"
    t.string   "attachmentable_type"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "file_type"
  end

  create_table "clients", :force => true do |t|
    t.string   "label"
    t.datetime "last_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "records", :force => true do |t|
    t.string   "client_id"
    t.string   "ue"
    t.string   "imei"
    t.float    "lat"
    t.float    "lon"
    t.float    "distance"
    t.date     "date"
    t.datetime "last_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "duration"
    t.string   "city"
  end

  create_table "videos", :force => true do |t|
    t.string   "note"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

end
