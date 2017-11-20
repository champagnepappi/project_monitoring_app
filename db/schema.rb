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

ActiveRecord::Schema.define(version: 20171120112304) do

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lecturer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["lecturer_id"], name: "index_bids_on_lecturer_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "lecturers", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.boolean  "admin",             default: false
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "status",            default: 0
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.string   "video"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "email"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status",      default: 0
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "supervisor_id"
    t.integer  "supervised_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["supervised_id"], name: "index_relationships_on_supervised_id"
    t.index ["supervisor_id", "supervised_id"], name: "index_relationships_on_supervisor_id_and_supervised_id", unique: true
    t.index ["supervisor_id"], name: "index_relationships_on_supervisor_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text     "content"
    t.integer  "message_id"
    t.integer  "lecturer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
    t.index ["lecturer_id"], name: "index_replies_on_lecturer_id"
    t.index ["message_id"], name: "index_replies_on_message_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "reg_no"
    t.string   "gender"
    t.string   "department"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.boolean  "admin",             default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "status",            default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
