# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :region
  has_many :advertisements, dependent: :nullify
  has_many :users, dependent: :nullify

  validates :name, uniqueness: { message: 'of city is already taken', case_sensitive: false, scope: :region_id }
end
