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

ActiveRecord::Schema.define(version: 2021_02_11_174749) do

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.text "note"
    t.integer "published_at"
    t.integer "audio_length_sec"
    t.integer "podcast_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "listen_ep_id"
    t.index ["listen_ep_id"], name: "index_episodes_on_listen_ep_id"
    t.index ["podcast_id"], name: "index_episodes_on_podcast_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "title"
    t.string "host"
    t.string "cover"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "listen_id"
    t.index ["listen_id"], name: "index_podcasts_on_listen_id"
  end

  add_foreign_key "episodes", "podcasts"
end
