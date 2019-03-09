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

ActiveRecord::Schema.define(version: 2019_03_09_195333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "building_name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shareables", force: :cascade do |t|
    t.string "product_name"
    t.boolean "good"
    t.boolean "service"
    t.bigint "building_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_shareables_on_building_id"
    t.index ["user_id"], name: "index_shareables_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_name"
    t.boolean "approved"
    t.boolean "completed"
    t.string "recipient"
    t.bigint "user_id"
    t.bigint "building_id"
    t.bigint "shareable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_transactions_on_building_id"
    t.index ["shareable_id"], name: "index_transactions_on_shareable_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "first_name"
    t.string "last_name"
    t.string "picture_url"
    t.string "utility_bill_url"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_users_on_building_id"
  end

  add_foreign_key "shareables", "buildings"
  add_foreign_key "shareables", "users"
  add_foreign_key "transactions", "buildings"
  add_foreign_key "transactions", "shareables"
  add_foreign_key "transactions", "users"
  add_foreign_key "users", "buildings"
end
