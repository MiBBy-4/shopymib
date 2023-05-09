# frozen_string_literal: true

FactoryBot.define do
  factory :category_setting do
    name { Faker::Lorem.word }
    values_type { 'text' }
    required { false }
    subcategory { create(:subcategory) }
  end
end
