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
    t.bigint "buildings_id"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buildings_id"], name: "index_shareables_on_buildings_id"
    t.index ["users_id"], name: "index_shareables_on_users_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_name"
    t.boolean "approved"
    t.boolean "completed"
    t.string "recipient"
    t.bigint "users_id"
    t.bigint "buildings_id"
    t.bigint "shareables_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buildings_id"], name: "index_transactions_on_buildings_id"
    t.index ["shareables_id"], name: "index_transactions_on_shareables_id"
    t.index ["users_id"], name: "index_transactions_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "first_name"
    t.string "last_name"
    t.string "picture_url"
    t.string "utility_bill_url"
    t.bigint "buildings_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buildings_id"], name: "index_users_on_buildings_id"
  end

  add_foreign_key "shareables", "buildings", column: "buildings_id"
  add_foreign_key "shareables", "users", column: "users_id"
  add_foreign_key "transactions", "buildings", column: "buildings_id"
  add_foreign_key "transactions", "shareables", column: "shareables_id"
  add_foreign_key "transactions", "users", column: "users_id"
  add_foreign_key "users", "buildings", column: "buildings_id"
end
