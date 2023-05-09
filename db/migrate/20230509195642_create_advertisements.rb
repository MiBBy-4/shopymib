# frozen_string_literal: true

class CreateAdvertisements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisements do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''
      t.string :customer_name
      t.string :customer_email
      t.string :customer_phone
      t.boolean :phone_visible
      t.belongs_to :city, null: false, foreign_key: true
      t.belongs_to :subcategory, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
