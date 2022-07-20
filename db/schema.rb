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

ActiveRecord::Schema.define(version: 2022_07_18_084838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "word_id"
    t.bigint "lesson_id"
    t.index ["lesson_id"], name: "index_appearances_on_lesson_id"
    t.index ["word_id", "lesson_id"], name: "index_appearances_on_word_id_and_lesson_id", unique: true
    t.index ["word_id"], name: "index_appearances_on_word_id"
  end

  create_table "examples", force: :cascade do |t|
    t.text "sentence_ja"
    t.text "sentence_ar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "word_id"
    t.index ["word_id"], name: "index_examples_on_word_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "edition"
    t.integer "lv"
    t.integer "category"
    t.integer "lesson_no"
    t.integer "lesson_seq"
    t.string "lesson_name"
    t.string "lesson_name_ar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relations", force: :cascade do |t|
    t.integer "rel_id", null: false
    t.integer "lock_version", default: 0, null: false
    t.integer "syn_ant_cd", null: false
    t.integer "ant_contrast_cd"
    t.string "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "word_id"
    t.index ["rel_id", "word_id", "syn_ant_cd"], name: "index_relations_on_rel_id_and_word_id_and_syn_ant_cd", unique: true
    t.index ["word_id"], name: "index_relations_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "example@example.com", null: false
    t.string "salt"
    t.integer "level"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.index ["activation_token"], name: "index_users_on_activation_token"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "word", null: false
    t.string "word_with_pron", null: false
    t.string "pos"
    t.text "meaning", null: false
    t.string "root"
    t.integer "plural_word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word", "word_with_pron", "meaning", "root"], name: "index_words_on_word_and_word_with_pron_and_meaning_and_root"
  end

  add_foreign_key "appearances", "lessons"
  add_foreign_key "appearances", "words"
  add_foreign_key "examples", "words"
  add_foreign_key "relations", "words"
end
