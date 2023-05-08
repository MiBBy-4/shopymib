# frozen_string_literal: true

RSpec.describe Region do
  describe 'validations' do
    it do
      expect(subject).to validate_uniqueness_of(:name).case_insensitive.with_message('of region is already taken')
    end
  end

  describe 'associations' do
    it do
      expect(subject).to have_many(:cities)
    end
  end
end
