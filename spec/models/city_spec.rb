# frozen_string_literal: true

RSpec.describe City do
  describe 'validations' do
    subject { described_class.new(name: Faker::Lorem.sentence, region:) }

    let(:region) { create(:region) }

    it do
      expect(subject).to validate_uniqueness_of(:name).scoped_to(:region_id).case_insensitive
                                                      .with_message('of city is already taken')
    end
  end

  describe 'associations' do
    it do
      expect(subject).to belong_to(:region)
    end
  end
end
