# frozen_string_literal: true

class CreateAdvertisementParams < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisement_params do |t|
      t.string :name
      t.string :value
      t.belongs_to :advertisement, null: false, foreign_key: true

      t.timestamps
    end
  end
end