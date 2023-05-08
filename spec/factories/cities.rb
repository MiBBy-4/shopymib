# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    region { build(:region) }
    name { Faker::Lorem.word }
  end
end
