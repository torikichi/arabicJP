# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160610081108) do

  create_table "appearances", id: false, force: :cascade do |t|
    t.integer  "word_id",    null: false
    t.integer  "appr_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "appearances", ["word_id", "appr_id"], name: "index_appearances_on_word_id_and_appr_id", unique: true

  create_table "examples", id: false, force: :cascade do |t|
    t.integer  "word_id",     null: false
    t.integer  "exp_seq",     null: false
    t.text     "sentence_ja"
    t.text     "sentence_ar"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "examples", ["word_id", "exp_seq"], name: "index_examples_on_word_id_and_exp_seq", unique: true

  create_table "lessons", force: :cascade do |t|
    t.integer  "ampm"
    t.integer  "lv"
    t.integer  "category"
    t.integer  "lesson_no"
    t.integer  "lesson_seq"
    t.string   "lesson_name"
    t.string   "lesson_name_ar"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "relations", id: false, force: :cascade do |t|
    t.integer  "rel_id",          null: false
    t.integer  "word_id",         null: false
    t.integer  "syn_ant_cd",      null: false
    t.integer  "ant_contrast_cd"
    t.string   "type_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "relations", ["rel_id", "word_id", "syn_ant_cd"], name: "index_relations_on_rel_id_and_word_id_and_syn_ant_cd", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name",                            null: false
    t.integer  "contact_cd"
    t.string   "contact"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

  add_index "users", ["name"], name: "index_users_on_name"

  create_table "words", force: :cascade do |t|
    t.string   "word",           null: false
    t.string   "word_with_pron", null: false
    t.string   "pos"
    t.text     "meaning",        null: false
    t.string   "root"
    t.integer  "plural_cd"
    t.integer  "plural_ord"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "words", ["word", "word_with_pron", "meaning", "root"], name: "index_words_on_word_and_word_with_pron_and_meaning_and_root"

end
