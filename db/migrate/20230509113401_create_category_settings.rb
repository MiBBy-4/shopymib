# frozen_string_literal: true

class CreateCategorySettings < ActiveRecord::Migration[7.0]
  def change
    create_table :category_settings do |t|
      t.string :name, null: false, default: ''
      t.string :values_type, null: false, default: 'text'
      t.boolean :required, default: false
      t.belongs_to :subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
