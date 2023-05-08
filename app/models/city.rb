# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :region

  validates :name, uniqueness: { message: 'of city is already taken', case_sensitive: false, scope: :region_id }
end
