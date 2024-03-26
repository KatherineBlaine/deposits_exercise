require 'rails_helper'

RSpec.describe 'Deposits', type: :request do
  describe 'POST /tradelines/:tradeline_id/deposits' do
    let(:tradeline) { create(:tradeline) }
    let(:valid_attributes) { attributes_for(:deposit) }

    context 'with valid parameters' do
      it 'creates a new deposit' do
        expect {
          post tradeline_deposits_path(tradeline), params: { deposit: valid_attributes }
        }.to change(Deposit, :count).by(1)
      end

      it 'returns a success response' do
        post tradeline_deposits_path(tradeline), params: { deposit: valid_attributes }
        expect(response).to have_http_status(:created)
      end

      it 'associates the deposit with the tradeline' do
        post tradeline_deposits_path(tradeline), params: { deposit: valid_attributes }
        expect(Deposit.last.tradeline).to eq(tradeline)
      end
    end
  end
end