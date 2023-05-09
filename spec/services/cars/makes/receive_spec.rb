# frozen_string_literal: true

RSpec.describe Services::Cars::Makes::Receive do
  it 'successfully receive data' do
    VCR.use_cassette('cars/makes/receive_successfully') do
      receiver = described_class.call

      expect(receiver.value).to be_an_instance_of(Array).and include('BMW')
      expect(receiver.success?).to be(true)
    end
  end
end
