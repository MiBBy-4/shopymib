# frozen_string_literal: true

class AddParamsToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.date :birth_date
      t.boolean :sex
      t.string :name
    end
  end
end
