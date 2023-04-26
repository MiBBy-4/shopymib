# frozen_string_literal: true

RSpec.describe User do
  describe 'validation' do
    it do
      expect(subject).to validate_length_of(:phone_number).is_equal_to(13)
    end

    it do
      expect(subject).to allow_value('+375331234567').for(:phone_number)
    end

    it do
      expect(subject).not_to allow_value('+375121234567').for(:phone_number)
                                                         .with_message('must be a valid Belarusian phone number')
    end

    it do
      expect(subject).not_to allow_value('12345678901234').for(:phone_number)
                                                          .with_message('must be a valid Belarusian phone number')
    end

    it do
      expect(subject).to validate_uniqueness_of(:phone_number).with_message('phone number is already taken')
    end
  end
end
