# frozen_string_literal: true

class AddPhoneNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone_number, :string, default: ''
    add_index :users, :phone_number, unique: true, where: 'phone_number IS NOT NULL',
                                     name: 'unique_not_null_phone_number'
  end
end
