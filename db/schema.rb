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

ActiveRecord::Schema.define(:version => 20130508021101) do

  create_table "auth_sources", :force => true do |t|
    t.string   "token"
    t.string   "secret"
    t.string   "uid"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "auth_sources", ["provider"], :name => "index_auth_sources_on_provider"
  add_index "auth_sources", ["uid"], :name => "index_auth_sources_on_uid"
  add_index "auth_sources", ["user_id", "provider"], :name => "index_auth_sources_on_user_id_and_provider", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
