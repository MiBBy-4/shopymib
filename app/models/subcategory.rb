# frozen_string_literal: true

class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :category_settings, dependent: :delete_all
  has_many :advertisements, dependent: :nullify

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
end
