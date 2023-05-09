# frozen_string_literal: true

FactoryBot.define do
  factory :subcategory do
    name { Faker::Lorem.word }
    category { create(:category) }
  end
end
