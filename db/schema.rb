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

ActiveRecord::Schema.define(version: 2019_02_03_062131) do

  create_table "airplanes", force: :cascade do |t|
    t.string "name"
    t.integer "seats"
    t.string "category"
    t.string "rows"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source"
    t.string "destination"
    t.float "price"
  end

# Could not dump table "bookings" because of following StandardError
#   Unknown type '' for column 'status'

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
