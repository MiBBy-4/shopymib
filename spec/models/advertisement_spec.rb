# frozen_string_literal: true

RSpec.describe Advertisement do
  subject(:advertisements) { create(:advertisement) }

  describe 'associations' do
    it do
      expect(subject).to belong_to(:user)
      expect(subject).to belong_to(:city)
      expect(subject).to belong_to(:subcategory)
    end
  end

  describe 'validations' do
    it do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_length_of(:name).is_at_most(50)
    end

    it do
      expect(subject).to validate_presence_of(:description)
      expect(subject).to validate_length_of(:description).is_at_most(4000)
    end
  end
end
