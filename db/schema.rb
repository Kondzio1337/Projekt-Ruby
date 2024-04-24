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

ActiveRecord::Schema[7.1].define(version: 2024_04_17_125359) do
  create_table "branzas", force: :cascade do |t|
    t.string "nazwa", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nazwa"], name: "index_branzas_on_nazwa", unique: true
  end

  create_table "firmas", force: :cascade do |t|
    t.string "nazwa", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "odpowiedzs", force: :cascade do |t|
    t.integer "id_oferty"
    t.integer "wiek"
    t.integer "rodzaj_wyksztalcenia"
    t.string "miejsce_zamieszaknia"
    t.boolean "staz"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oferta", force: :cascade do |t|
    t.integer "id_branzy", null: false
    t.integer "id_stanowiska", null: false
    t.integer "id_firmy", null: false
    t.string "tytul", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rodzaj", null: false
    t.index ["id_branzy"], name: "index_oferta_on_id_branzy"
    t.index ["id_firmy"], name: "index_oferta_on_id_firmy"
    t.index ["id_stanowiska"], name: "index_oferta_on_id_stanowiska"
  end

  create_table "stanowiskos", force: :cascade do |t|
    t.string "nazwa", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "odpowiedzs", "oferta", column: "id_oferty"
  add_foreign_key "oferta", "branzas", column: "id_branzy"
  add_foreign_key "oferta", "firmas", column: "id_firmy"
  add_foreign_key "oferta", "stanowiskos", column: "id_stanowiska"
end
