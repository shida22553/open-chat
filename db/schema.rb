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

ActiveRecord::Schema.define(version: 2021_08_15_073244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "message_reactions", force: :cascade do |t|
    t.string "user_id"
    t.string "user_name"
    t.bigint "message_id", null: false
    t.bigint "reaction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_message_reactions_on_message_id"
    t.index ["reaction_id"], name: "index_message_reactions_on_reaction_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.string "user_name"
    t.string "user_id"
    t.text "content"
    t.integer "content_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "message_reactions", "messages"
  add_foreign_key "message_reactions", "reactions"
  add_foreign_key "messages", "rooms"
end
