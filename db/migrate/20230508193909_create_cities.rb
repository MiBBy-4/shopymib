# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.belongs_to :region, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
