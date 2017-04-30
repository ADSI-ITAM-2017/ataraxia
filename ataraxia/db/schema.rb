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

ActiveRecord::Schema.define(version: 20170430180158) do

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "description"
    t.decimal  "price"
    t.boolean  "available"
    t.integer  "lesee"
    t.integer  "distance"
    t.boolean  "elevator"
    t.boolean  "ground_floor"
    t.boolean  "pets_allowed"
    t.boolean  "furnished"
    t.boolean  "cleaning_service"
    t.boolean  "female_roomies"
    t.boolean  "male_roomies"
    t.boolean  "gym"
    t.boolean  "smoking_is_allowed"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "gender"
    t.integer  "age"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
