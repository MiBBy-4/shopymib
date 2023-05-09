# frozen_string_literal: true

class CreateSettingValues < ActiveRecord::Migration[7.0]
  def change
    create_table :setting_values do |t|
      t.string :value, null: false, default: ''
      t.belongs_to :category_setting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
