# frozen_string_literal: true

RSpec.describe Subcategory do
  subject(:subcategory) { create(:subcategory) }

  describe 'associations' do
    it do
      expect(subject).to belong_to(:category)
      expect(subject).to have_many(:category_settings).dependent(:delete_all)
      expect(subject).to have_many(:advertisements).dependent(:nullify)
    end
  end

  describe 'validations' do
    it do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_uniqueness_of(:name)
      expect(subject).to validate_length_of(:name).is_at_most(50)
    end
  end
end
