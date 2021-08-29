# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_29_100403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_uploads", force: :cascade do |t|
    t.jsonb "file_data"
    t.string "status"
    t.jsonb "data_columns"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_contact_uploads_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "date_of_birth"
    t.string "phone"
    t.string "address"
    t.string "credit_card"
    t.string "franchise"
    t.string "email"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "email"], name: "index_contacts_on_user_id_and_email", unique: true
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "upload_errors", force: :cascade do |t|
    t.text "details"
    t.integer "upload_row"
    t.bigint "contact_upload_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_upload_id"], name: "index_upload_errors_on_contact_upload_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contact_uploads", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "upload_errors", "contact_uploads"
end
