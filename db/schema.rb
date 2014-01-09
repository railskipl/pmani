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

ActiveRecord::Schema.define(:version => 20140109101730) do

  create_table "consumers", :force => true do |t|
    t.string   "name"
    t.integer  "sub_zone_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "consumer_inxex_no"
    t.string   "meter_no"
    t.string   "new_meter_no"
    t.string   "current_meter_reading"
    t.string   "meter_status"
    t.string   "meter_status_desc"
    t.string   "remarks"
    t.string   "contact_no"
    t.string   "walk_id"
    t.integer  "zone_id"
    t.datetime "date_time"
    t.string   "mr_code"
    t.string   "mr_name"
    t.string   "image"
    t.string   "billing_cycle"
    t.text     "consumer_address"
    t.string   "category"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "readers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sub_zone_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "zone_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "sub_zones", :force => true do |t|
    t.string   "name"
    t.integer  "zone_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "role_id",                :default => 2
    t.string   "username"
  end

  create_table "zones", :force => true do |t|
    t.integer  "zone_number"
    t.string   "zone_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
