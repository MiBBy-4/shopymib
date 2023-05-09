# frozen_string_literal: true

RSpec.describe Services::AdministrationDivisions::Regions::Receive do
  it 'successfully receive data' do
    VCR.use_cassette('administation_divisions/receive_successfully') do
      receiver = described_class.call

      expect(receiver.value).to be_an_instance_of(Array).and include('Минск')
      expect(receiver.success?).to be(true)
    end
  end
end
