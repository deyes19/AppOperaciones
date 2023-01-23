# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_21_164401) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actives", force: :cascade do |t|
    t.string "barcode"
    t.string "serial"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "destination_id", null: false
    t.bigint "ubication_id", null: false
    t.bigint "user_id", null: false
    t.bigint "active_type_id", null: false
    t.boolean "status"
    t.integer "plate"
    t.bigint "rankactive_id", null: false
    t.string "dad"
    t.index ["active_type_id", "plate"], name: "index_actives_on_active_type_id_and_plate"
    t.index ["active_type_id"], name: "index_actives_on_active_type_id"
    t.index ["destination_id"], name: "index_actives_on_destination_id"
    t.index ["rankactive_id"], name: "index_actives_on_rankactive_id"
    t.index ["ubication_id"], name: "index_actives_on_ubication_id"
    t.index ["user_id"], name: "index_actives_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "centers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "zone_id", null: false
    t.index ["zone_id"], name: "index_centers_on_zone_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "center_id", null: false
    t.index ["center_id"], name: "index_destinations_on_center_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.date "date_buy"
    t.text "pricebuy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rankactives", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.integer "nit"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ubications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "destination_id", null: false
    t.index ["destination_id"], name: "index_ubications_on_destination_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "actives", "active_types"
  add_foreign_key "actives", "destinations"
  add_foreign_key "actives", "rankactives"
  add_foreign_key "actives", "ubications"
  add_foreign_key "actives", "users"
  add_foreign_key "centers", "zones"
  add_foreign_key "destinations", "centers"
  add_foreign_key "ubications", "destinations"
  add_foreign_key "users", "roles"
end
