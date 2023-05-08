# frozen_string_literal: true

class Region < ApplicationRecord
  has_many :cities, dependent: :delete_all

  validates :name, uniqueness: { message: 'of region is already taken', case_sensitive: false }
end
