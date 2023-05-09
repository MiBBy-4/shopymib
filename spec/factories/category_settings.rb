# frozen_string_literal: true

FactoryBot.define do
  factory :category_setting do
    name { Faker::Lorem.word }
    values_type { 'input' }
    required { false }
    subcategory { create(:subcategory) }
  end
end
