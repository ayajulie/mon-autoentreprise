# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 2021_10_13_122236) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "client"
    t.integer "amout"
    t.datetime "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "comptabilites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "immobilisations"
    t.integer "valeur_credit_bail"
    t.integer "charges_repartir"
    t.integer "primes_remboursement"
    t.integer "stocks"
    t.integer "avances"
    t.integer "creance"
    t.integer "effets_escomptes"
    t.integer "valeur_mobilieres"
    t.integer "disponibilites"
    t.integer "capitaux_propres"
    t.integer "dettes_financieres"
    t.integer "emprunt_credit_bail"
    t.integer "dettes_exploitations"
    t.integer "dettes_fiscales"
    t.integer "tresorerie_passive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "resultats"
    t.integer "achats_marchandises"
    t.integer "ventes_marchandises"
    t.integer "chiffre_affaire"
    t.string "name"
    t.index ["user_id"], name: "index_comptabilites_on_user_id"
  end

  create_table "devis", force: :cascade do |t|
<<<<<<< HEAD

    t.bigint "client_id", null: false

=======
>>>>>>> miseendemeure
    t.bigint "user_id", null: false
    t.string "name"
    t.string "reference_devis"
    t.integer "amount"
    t.datetime "devis_at"
    t.string "object"
    t.string "interet"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
<<<<<<< HEAD
    t.index ["client_id"], name: "index_devis_on_client_id"

    t.boolean "success"




=======
    t.boolean "success"
>>>>>>> miseendemeure
    t.index ["user_id"], name: "index_devis_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "name"
    t.string "object"
    t.integer "amount"
    t.integer "pretaxamout"
    t.integer "postaxmout"
    t.datetime "invoiced_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

<<<<<<< HEAD
=======
  create_table "miseendemeures", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.string "refence"
    t.date "day"
    t.integer "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_miseendemeures_on_user_id"
  end

>>>>>>> miseendemeure
  create_table "relances", force: :cascade do |t|
    t.string "name"
    t.datetime "creance_at"
    t.integer "creance"
    t.decimal "interests"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_relances_on_user_id"
  end

<<<<<<< HEAD
=======
  create_table "societes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "denomination_sociale"
    t.integer "apports"
    t.integer "capital_social"
    t.integer "duree"
    t.integer "nombre_actions"
    t.integer "valeur_actions"
    t.integer "numero_RCS"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_societes_on_user_id"
  end

>>>>>>> miseendemeure
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "birth_last_name"
    t.string "use_name"
    t.string "pseudonym"
    t.string "citizenship"
    t.string "gender"
    t.string "birth_city"
    t.string "birth_department"
    t.string "birth_country"
    t.string "address"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.boolean "spouse_working_in_company"
    t.string "phone_number"
    t.string "ssn"
    t.string "remarks"
    t.string "company_name"
    t.string "company_address"
    t.string "company_city"
    t.string "company_zipcode"
    t.string "company_country"
    t.string "start_activity"
    t.boolean "seasonal_activity"
    t.boolean "itinerant_activity"
    t.string "main_activity_freetext"
    t.string "main_activity_choose"
    t.boolean "employee"
    t.boolean "partner"
    t.string "siren"
    t.boolean "individual_entrepreneur"
    t.boolean "bic_status"
    t.string "contribution_periodicity"
    t.boolean "other_activity"
    t.boolean "income_tax_lump_payment"
    t.string "last_name"
    t.string "birth_date"
    t.string "exercising_mode_declaration"
    t.string "business_origin"
    t.string "establishment_address"
    t.string "paying_agent"
    t.boolean "past_salaried_activity"
    t.string "paying_agent_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clients", "users"
  add_foreign_key "comptabilites", "users"
<<<<<<< HEAD



  add_foreign_key "devis", "clients"


  add_foreign_key "devis", "users"
  add_foreign_key "invoices", "users"
  add_foreign_key "relances", "users"
=======
  add_foreign_key "devis", "users"
  add_foreign_key "invoices", "users"
  add_foreign_key "miseendemeures", "users"
  add_foreign_key "relances", "users"
  add_foreign_key "societes", "users"
>>>>>>> miseendemeure
end
