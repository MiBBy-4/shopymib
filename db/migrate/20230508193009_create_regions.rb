# frozen_string_literal: true

class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :name, default: '', null: false

      t.timestamps
    end

    add_index :regions, :name, unique: true
  end
end
