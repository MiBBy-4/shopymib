# frozen_string_literal: true

FactoryBot.define do
  factory :advertisement_param do
    name { 'MyString' }
    value { 'MyString' }
    advertisement { nil }
  end
end
