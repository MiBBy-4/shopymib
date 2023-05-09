# frozen_string_literal: true

RSpec.describe CategorySetting do
  subject(:category_setting) { create(:category_setting) }

  describe 'associations' do
    it do
      expect(subject).to belong_to(:subcategory)
      expect(subject).to have_many(:setting_values).dependent(:delete_all)
    end
  end

  describe 'validations' do
    it do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_uniqueness_of(:name).scoped_to(:subcategory_id)
      expect(subject).to validate_length_of(:name).is_at_most(25)
    end

    it do
      expect(subject).to validate_presence_of(:values_type)
      expect(subject).to validate_inclusion_of(:values_type).in_array(%w[text select radio])
    end
  end
end
