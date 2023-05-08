# frozen_string_literal: true

RSpec.describe 'Create' do
  let(:user_authorization) { post new_user_session_path, params: { user: attributes } }
  let(:user) { create(:user) }

  before { user_authorization }

  context 'with valid params' do
    context 'with phone number' do
      let(:attributes) { { login: user.phone_number, password: user.password } }

      it 'valid response' do
        expect(response).to have_http_status(:redirect)
        expect(flash[:notice]).to be_present
      end
    end

    context 'with email' do
      let(:attributes) { { login: user.email, password: user.password } }

      it 'valid response' do
        expect(response).to have_http_status(:redirect)
        expect(flash[:notice]).to be_present
      end
    end
  end

  context 'with invalid params' do
    let(:attributes) { { phone_number: '1234567890123', password: user.password } }

    it 'valid response with alert' do
      expect(flash[:alert]).to be_present
      expect(response).to have_http_status(:ok)
    end
  end
end
