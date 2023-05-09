# frozen_string_literal: true

FactoryBot.define do
  factory :setting_value do
    value { Faker::Lorem.word }
    category_setting { create(:category_setting) }
  end
end
