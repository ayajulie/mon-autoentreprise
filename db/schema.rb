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

ActiveRecord::Schema.define(version: 2021_02_27_144726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "birth_date"
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
    t.datetime "start_activity"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
