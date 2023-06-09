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

ActiveRecord::Schema[7.0].define(version: 2023_06_04_103413) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifters", force: :cascade do |t|
    t.bigint "gift_id", null: false
    t.string "name"
    t.string "email"
    t.text "message"
    t.decimal "contribution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_id"], name: "index_gifters_on_gift_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "link", null: false
    t.string "image_url"
    t.decimal "cost", null: false
    t.string "ref"
    t.boolean "splittable", default: false
    t.boolean "bought", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "gifters", "gifts"
end
