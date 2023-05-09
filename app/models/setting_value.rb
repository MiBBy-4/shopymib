# frozen_string_literal: true

class SettingValue < ApplicationRecord
  belongs_to :category_setting

  validates :value, presence: true, length: { maximum: 50 }, uniqueness: { scope: :category_setting_id }
end
