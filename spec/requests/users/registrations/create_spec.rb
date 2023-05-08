# frozen_string_literal: true

RSpec.describe 'Create' do
  let(:user_creation) { post user_registration_path, params: { user: attributes } }

  context 'with valid params' do
    let(:attributes) do
      { email: Faker::Internet.email, password: 'testpassword', password_confirmation: 'testpassword' }
    end

    it 'creates a new User' do
      expect { user_creation }.to change(User, :count).by(1)
    end

    it 'has valid response' do
      user_creation

      expect(response).to have_http_status(:found)
      expect(flash[:notice]).to be_present
    end
  end

  context 'with invalid params' do
    let(:attributes) { { email: 'nonvalid', password: 'testpassword', password_confirmation: 'nonvalid' } }

    it 'not create a new User' do
      expect { user_creation }.not_to change(User, :count)
    end
  end
end
