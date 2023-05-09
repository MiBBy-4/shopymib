# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :subcategories, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :icon, presence: true, uniqueness: true
end
