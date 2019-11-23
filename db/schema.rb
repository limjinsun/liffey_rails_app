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

ActiveRecord::Schema.define(version: 2019_11_22_194300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "specialprice", precision: 10, scale: 2
    t.datetime "specialdue"
    t.string "description"
    t.string "admintext"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "school_id", null: false
    t.string "coursetag"
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "order_confirms", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id", null: false
    t.index ["order_id"], name: "index_order_confirms_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "arrival"
    t.string "duration_homestay"
    t.string "exitexam"
    t.boolean "medical_insurance"
    t.datetime "vacation1_start"
    t.datetime "vacation1_end"
    t.datetime "vacation2_start"
    t.datetime "vacation2_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "refprice"
    t.bigint "course_id"
    t.string "extracoursename"
    t.string "flightinfo"
    t.index ["course_id"], name: "index_orders_on_course_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "size"
    t.string "type"
    t.string "classsize"
    t.string "certificate"
    t.decimal "admissionfee", precision: 10, scale: 2
    t.decimal "textbookfee", precision: 10, scale: 2
    t.decimal "insurancefee", precision: 10, scale: 2
    t.decimal "examfee", precision: 10, scale: 2
    t.decimal "hostbookingfee", precision: 10, scale: 2
    t.decimal "hostfeeperweek", precision: 10, scale: 2
    t.string "address"
    t.string "fb"
    t.string "insta"
    t.string "youtube"
    t.string "web"
    t.string "wiki"
    t.decimal "longitude", precision: 10, scale: 7
    t.decimal "latitude", precision: 10, scale: 7
    t.string "desc"
    t.string "admintext"
    t.string "nationalmix"
    t.string "towndistance"
    t.string "activity"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "good"
    t.string "bad"
    t.string "schooltag"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "courses", "schools"
  add_foreign_key "order_confirms", "orders"
  add_foreign_key "orders", "courses"
  add_foreign_key "orders", "users"
end
