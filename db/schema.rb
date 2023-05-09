# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_509_113_814) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.string 'icon', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_categories_on_name', unique: true
  end

  create_table 'category_settings', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.string 'values_type', default: 'input', null: false
    t.boolean 'required', default: false
    t.bigint 'subcategory_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['subcategory_id'], name: 'index_category_settings_on_subcategory_id'
  end

  create_table 'cities', force: :cascade do |t|
    t.bigint 'region_id', null: false
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['region_id'], name: 'index_cities_on_region_id'
  end

  create_table 'regions', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_regions_on_name', unique: true
  end

  create_table 'setting_values', force: :cascade do |t|
    t.string 'value', default: '', null: false
    t.bigint 'category_setting_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_setting_id'], name: 'index_setting_values_on_category_setting_id'
  end

  create_table 'subcategories', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_subcategories_on_category_id'
    t.index ['name'], name: 'index_subcategories_on_name', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'phone_number', default: ''
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['phone_number'], name: 'unique_not_null_phone_number', unique: true, where: '(phone_number IS NOT NULL)'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'category_settings', 'subcategories'
  add_foreign_key 'cities', 'regions'
  add_foreign_key 'setting_values', 'category_settings'
  add_foreign_key 'subcategories', 'categories'
end
