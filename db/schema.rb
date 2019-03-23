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

ActiveRecord::Schema.define(version: 2019_03_17_062714) do

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

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id"
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
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
