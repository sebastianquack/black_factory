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

ActiveRecord::Schema.define(:version => 20130903101017) do

  create_table "challenges", :force => true do |t|
    t.string   "name"
    t.datetime "time"
    t.text     "description"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "hidden",           :default => true
    t.integer  "main_image_id"
    t.integer  "winner_design_id"
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "design_id"
    t.string   "username"
    t.string   "ip"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "challenge_id"
    t.boolean  "hidden",       :default => false
  end

  create_table "designs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "challenge_id"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.string   "username"
    t.boolean  "hidden",                                      :default => false
    t.integer  "main_image_id"
    t.decimal  "score",         :precision => 5, :scale => 1
    t.integer  "vote_count"
  end

  create_table "images", :force => true do |t|
    t.integer  "challenge_id"
    t.integer  "design_id"
    t.string   "ip"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "hidden",             :default => false
    t.string   "upload_hash"
    t.text     "description"
  end

  create_table "media_links", :force => true do |t|
    t.integer  "challenge_id"
    t.integer  "design_id"
    t.string   "url"
    t.string   "ip"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "hidden",       :default => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "reward_codes", :force => true do |t|
    t.string   "code"
    t.integer  "type"
    t.integer  "points"
    t.integer  "achievement_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "status",         :default => 0
  end

  create_table "username_cookies", :force => true do |t|
    t.string   "cookiehash"
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "username_scores", :force => true do |t|
    t.string   "username"
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vote_cookies", :force => true do |t|
    t.string   "cookiehash"
    t.integer  "design_id"
    t.integer  "vote"
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
