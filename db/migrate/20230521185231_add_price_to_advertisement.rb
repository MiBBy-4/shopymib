# frozen_string_literal: true

class AddPriceToAdvertisement < ActiveRecord::Migration[7.0]
  def change
    add_column :advertisements, :price, :float, default: 0.0, null: false
  end
end
