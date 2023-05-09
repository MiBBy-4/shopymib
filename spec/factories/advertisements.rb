# frozen_string_literal: true

FactoryBot.define do
  factory :advertisement do
    name { 'MyString' }
    description { 'MyText' }
    customer_name { 'MyString' }
    customer_email { 'MyString' }
    customer_phone { 'MyString' }
    phone_visible { false }
    city { create(:city) }
    subcategory { create(:subcategory) }
    user { create(:user) }
  end
end
