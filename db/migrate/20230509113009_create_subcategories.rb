# frozen_string_literal: true

class CreateSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :subcategories do |t|
      t.string :name, null: false, default: ''
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :subcategories, :name, unique: true
  end
end
