# frozen_string_literal: true

class CategorySetting < ApplicationRecord
  belongs_to :subcategory
  has_many :setting_values, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 25 }, uniqueness: { scope: :subcategory_id }
  validates :values_type, presence: true, inclusion: { in: %w[text select radio] }
end
