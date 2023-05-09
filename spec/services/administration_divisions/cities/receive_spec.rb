# frozen_string_literal: true

RSpec.describe Services::AdministrationDivisions::Cities::Receive do
  context 'with valid param' do
    it 'successfully receive data' do
      VCR.use_cassette('administation_divisions/receive_successfully') do
        receiver = described_class.call('Минск')

        expect(receiver.value).to be_an_instance_of(Array).and include('Заводской район')
        expect(receiver.success?).to be(true)
        expect(receiver.value.count).to eq(9)
      end
    end
  end
end
