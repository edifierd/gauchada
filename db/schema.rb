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

ActiveRecord::Schema.define(version: 20161201201031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buys", force: :cascade do |t|
    t.integer  "cantidad_eslabones"
    t.decimal  "costo_eslabon"
    t.datetime "fecha"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.string   "cuerpo"
    t.integer  "uer_id"
    t.integer  "gauchadaa_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "cuerpo"
    t.integer  "favor_id"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "respuesta",       default: "null"
    t.string   "visto_respuesta", default: "false"
    t.string   "visto_mensaje",   default: "false"
  end

  create_table "favors", force: :cascade do |t|
    t.string   "titulo"
    t.string   "ubicacion"
    t.text     "descripcion"
    t.string   "estado"
    t.datetime "fecha"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "foto",        default: ""
  end

  create_table "gauchadaas", force: :cascade do |t|
    t.string   "ad"
    t.string   "titulo"
    t.string   "ubicacion"
    t.text     "descripcion"
    t.string   "foto"
    t.integer  "estado"
    t.datetime "fecha"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.boolean  "otorgado"
    t.text     "cuerpo"
    t.integer  "user_id"
    t.integer  "favor_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "visto",           default: "false"
    t.string   "vistopostulante", default: "false"
  end

  create_table "ofrecimientos", force: :cascade do |t|
    t.integer  "estado"
    t.text     "mensaje"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "gauchadaa_id"
  end

  create_table "pays", force: :cascade do |t|
    t.integer  "cantidad_eslabones"
    t.decimal  "costo_eslabon"
    t.integer  "user_id"
    t.datetime "fecha"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "cantidad_eslabones"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "genre"
    t.integer  "age"
    t.string   "avatar_img"
    t.string   "secret_question"
    t.integer  "eslabon",                default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
