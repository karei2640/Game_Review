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

ActiveRecord::Schema.define(version: 2023_04_23_074331) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bord_favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "bordgame_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bord_view_counts", force: :cascade do |t|
    t.integer "bordgame_id"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bordgame_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "customer_id"
    t.integer "bordgame_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bordgame_comment"
  end

  create_table "bordgames", force: :cascade do |t|
    t.string "image"
    t.string "table_id"
    t.string "tableplat_id"
    t.string "category_id"
    t.string "game_title", null: false
    t.text "introduct_title", null: false
    t.text "introduct", null: false
    t.text "good_introduct"
    t.text "bad_introduct"
    t.text "bordgame_comment"
    t.text "overall_review", null: false
    t.integer "points", null: false
    t.date "release_date"
    t.string "genre"
    t.string "platform"
    t.string "category"
    t.integer "price"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bord_view_count", default: 0
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.integer "customer_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "parent_comment_id"
    t.index ["customer_id"], name: "index_comments_on_customer_id"
    t.index ["game_id"], name: "index_comments_on_game_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.date "birthday"
    t.string "post_code", null: false
    t.string "prefecture_code", null: false
    t.string "address", null: false
    t.string "telephone", null: false
    t.boolean "withdrawal", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question"
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_comments", force: :cascade do |t|
    t.text "game_comment"
    t.integer "customer_id"
    t.integer "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "image"
    t.string "genre_id"
    t.string "platform_id"
    t.string "category_id"
    t.string "game_title", null: false
    t.text "introduct_title", null: false
    t.text "introduct", null: false
    t.text "good_introduct"
    t.text "bad_introduct"
    t.text "game_comment"
    t.text "overall_review", null: false
    t.integer "points", null: false
    t.date "release_date"
    t.string "genre"
    t.string "platform"
    t.string "category"
    t.integer "price"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rank"
    t.integer "view_counts_count"
    t.integer "view_count", default: 0
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "genre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "status"
    t.string "name", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.string "reply_email"
    t.string "reply_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tableplats", force: :cascade do |t|
    t.string "name"
    t.integer "tableplat_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.integer "table_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "view_counts", force: :cascade do |t|
    t.integer "game_id"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "customers"
  add_foreign_key "comments", "games"
end
