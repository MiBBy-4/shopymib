# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    icon { Faker::Lorem.word }
  end
end
