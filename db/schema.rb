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

ActiveRecord::Schema.define(version: 2021_01_22_184223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dispatches", force: :cascade do |t|
    t.text "recipients", default: [], array: true
    t.text "template"
    t.text "log"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "recipient_names"
    t.text "recipient_emails"
    t.string "month"
    t.string "year"
    t.string "url"
  end

  create_table "members", force: :cascade do |t|
    t.text "first_name"
    t.text "middle_name"
    t.text "last_name", null: false
    t.text "address"
    t.text "city"
    t.text "state"
    t.text "zip"
    t.text "email"
    t.text "email_alternate"
    t.text "url"
    t.text "phone"
    t.text "phone_alternate"
    t.date "birthday"
    t.date "joined_on"
    t.date "renewed_on"
    t.date "expire_on"
    t.text "directory_items", default: [], array: true
    t.text "interests"
    t.text "source"
    t.date "subscription_started_on"
    t.date "subscription_renewed_on"
    t.date "subscription_end_on"
    t.text "newsletter_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "directory_update"
    t.text "email_list"
  end

  create_table "payments", force: :cascade do |t|
    t.text "first_name"
    t.text "middle_name"
    t.text "last_name"
    t.date "paid_on"
    t.date "expire_on"
    t.decimal "amount", precision: 8, scale: 2
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id"
    t.index ["member_id"], name: "index_payments_on_member_id"
  end

  add_foreign_key "payments", "members", on_delete: :nullify
end
