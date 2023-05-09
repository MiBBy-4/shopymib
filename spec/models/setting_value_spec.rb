# frozen_string_literal: true

RSpec.describe SettingValue do
  subject(:setting) { create(:setting_value) }

  describe 'associations' do
    it do
      expect(subject).to belong_to(:category_setting)
    end
  end

  describe 'validations' do
    it do
      expect(subject).to validate_presence_of(:value)
      expect(subject).to validate_uniqueness_of(:value).scoped_to(:category_setting_id)
      expect(subject).to validate_length_of(:value).is_at_most(50)
    end
  end
end
