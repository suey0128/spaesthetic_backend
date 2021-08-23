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

ActiveRecord::Schema.define(version: 2021_08_23_183550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer "content_creator_id"
    t.integer "campaign_id"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "business_type"
    t.text "profile_pic"
    t.text "description"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "country"
    t.text "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "business_id"
    t.string "name"
    t.string "image"
    t.string "location_name"
    t.string "location_type"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "country"
    t.string "compensation_type"
    t.float "compensation_market_value"
    t.date "start_date"
    t.date "end_date"
    t.date "application_deadline"
    t.integer "require_following_minimum"
    t.string "require_following_location"
    t.integer "require_following_female_ratio"
    t.string "require_gender"
    t.string "require_others"
    t.string "description"
    t.date "content_sent_by"
    t.date "must_post_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collabs", force: :cascade do |t|
    t.integer "content_creator_id"
    t.integer "campaign_id"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "content_creators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "instagram_username"
    t.text "instagram_url"
    t.integer "instagram_follower"
    t.integer "instagram_female_follower_ratio"
    t.string "instagram_top1_follow_location"
    t.boolean "instagram_connection_permission"
    t.integer "ave_rate_per_campaign"
    t.string "paypal_account"
    t.text "profile_pic"
    t.text "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "about_me"
  end

  create_table "direct_messages", force: :cascade do |t|
    t.integer "writer_id"
    t.integer "receiver_id"
    t.boolean "read"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "content_creator_id"
    t.integer "campaign_id"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "writer_id"
    t.string "writer_type"
    t.integer "receiver_id"
    t.string "receiver_type"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "read"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "source_user_id"
    t.text "content"
    t.boolean "read"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "referral_services", force: :cascade do |t|
    t.integer "content_creator_id"
    t.integer "campaign_id"
    t.string "employee_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "reviewee_id"
    t.string "reviewee_type"
    t.integer "reviewer_id"
    t.string "reviewer_type"
    t.float "rating"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "platform_user_type"
    t.integer "platform_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
