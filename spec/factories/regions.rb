# frozen_string_literal: true

FactoryBot.define do
  factory :region do
    name { Faker::Lorem.word }
  end
end
