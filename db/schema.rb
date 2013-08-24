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

ActiveRecord::Schema.define(:version => 20130824223642) do

  create_table "guest_assocs", :force => true do |t|
    t.integer "user_id"
    t.integer "guest_id"
  end

  create_table "menu_items", :force => true do |t|
    t.string  "title",       :null => false
    t.string  "description", :null => false
    t.integer "course",      :null => false
  end

  create_table "menus", :force => true do |t|
    t.integer  "entree_id",  :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dessert_id", :null => false
  end

  create_table "registry_items", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "description", :null => false
    t.float    "cost",        :null => false
    t.integer  "quantity",    :null => false
    t.string   "img",         :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "registry_reservations", :force => true do |t|
    t.integer "registry_item_id", :null => false
    t.integer "user_id",          :null => false
  end

  create_table "user_codes", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "code",       :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name",                                   :null => false
    t.integer  "status",     :limit => 1, :default => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
