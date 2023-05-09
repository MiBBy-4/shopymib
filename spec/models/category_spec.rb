# frozen_string_literal: true

RSpec.describe Category do
  subject(:category) { create(:category) }

  describe 'associations' do
    it do
      expect(subject).to have_many(:subcategories).dependent(:delete_all)
    end
  end

  describe 'validations' do
    it do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_uniqueness_of(:name)
      expect(subject).to validate_length_of(:name).is_at_most(50)
    end

    it do
      expect(subject).to validate_presence_of(:icon)
      expect(subject).to validate_uniqueness_of(:icon)
    end
  end
end
