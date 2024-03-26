require 'rails_helper'

RSpec.describe DepositsController, type: :controller do
  describe '#index' do
    let(:tradeline) { create(:tradeline) }

    it 'responds with a 200' do
      get :index, params: { tradeline_id: tradeline.id }
      expect(response).to have_http_status(:ok)
    end
  end
end