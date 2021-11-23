ActiveRecord::Schema.define(version: 2021_11_23_092254) do

  create_table "ads", force: :cascade do |t|
    t.string "title"
    t.string "type_ad"
    t.string "life_cycle"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.string "status"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo"
    t.integer "user_id"
    t.integer "ad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_ads", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "ad_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ad_id"], name: "index_tag_ads_on_ad_id"
    t.index ["tag_id"], name: "index_tag_ads_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email", default: "", null: false
    t.string "role"
    t.string "password_hash"
    t.string "password_salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
