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

ActiveRecord::Schema.define(version: 2021_04_11_051513) do

  create_table "incidents", force: :cascade do |t|
    t.text "description"
    t.string "location"
    t.datetime "time_occurred"
    t.integer "victim_id", null: false
    t.integer "volunteer_id"
    t.boolean "request_translator"
    t.string "contact_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["victim_id"], name: "index_incidents_on_victim_id"
  end

  create_table "victims", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "language"
    t.string "preferred_contact_method"
    t.string "contact_info"
    t.string "contact_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "incidents", "victims"
end
