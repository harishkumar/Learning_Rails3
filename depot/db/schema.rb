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

ActiveRecord::Schema.define(:version => 20120927095108) do

  create_table "carts", :force => true do |t|
    t.integer  "quantity"
    t.string   "description"
    t.integer  "product_id"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.decimal  "price",       :precision => 10, :scale => 0
    t.decimal  "total_price", :precision => 10, :scale => 0
    t.date     "date"
    t.time     "time"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "files", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "type"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "order_number"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.string   "reciept_no"
    t.integer  "quantity"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.date     "shopping_date"
    t.time     "shopping_time"
    t.decimal  "payment_amount", :precision => 10, :scale => 0
    t.boolean  "approval"
    t.integer  "product_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       :precision => 10, :scale => 0
    t.string   "photo_name"
    t.string   "photo_path"
    t.string   "photo_type"
    t.integer  "user_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "salt"
    t.integer  "role_id"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
