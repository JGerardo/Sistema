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

ActiveRecord::Schema.define(version: 20140703204012) do

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.string   "titulo"
    t.string   "autor"
    t.string   "editorial"
    t.float    "precio"
    t.float    "cantidad"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "e_mail"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "liked_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goal_sales", force: true do |t|
    t.integer  "user_id"
    t.string   "meta"
    t.boolean  "reached"
    t.datetime "fechainicio"
    t.datetime "fechafin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: true do |t|
    t.integer  "order_id"
    t.integer  "book_id"
    t.float    "importetotal"
    t.float    "preciounitario"
    t.integer  "cantidad"
    t.float    "descuento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "fechaPedido"
    t.datetime "fechaEntrega"
    t.datetime "fechaRealEntrega"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", force: true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.text     "descripcion"
    t.text     "acuerdo"
    t.string   "medio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "nombreempesa"
    t.string   "telefono"
    t.string   "e_mail"
    t.string   "direccion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_details", force: true do |t|
    t.integer  "sale_id"
    t.integer  "book_id"
    t.float    "cantidad"
    t.float    "precio"
    t.float    "descuento"
    t.float    "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "client_id"
    t.date     "fecha"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
