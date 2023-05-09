# frozen_string_literal: true

class Advertisement < ApplicationRecord
  belongs_to :city
  belongs_to :subcategory
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 4000 }
end
