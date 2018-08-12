require 'rails_helper'

RSpec.describe Api::V1::SurvivorsController, type: :controller do
  before do |example|
    subject unless example.metadata[:skip_before_hook]
  end

  describe 'GET #index' do
    let!(:survivors) { create_list(:survivor, 3, :with_items) }
    subject { get :index }

    include_examples 'shared examples for api/v1 responses', :success, 'survivors/index'
  end

  describe 'GET #show' do
    let!(:survivor) { create(:survivor) }
    subject { get :show, params: { id: survivor } }

    include_examples 'shared examples for api/v1 responses', :success, 'survivors/survivor'
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:survivor) }

    let(:invalid_attributes) do
      attributes_for(
        :survivor,
        name: '',
        age: nil,
        gender: 'not-a-valid-gender',
        latitude: nil,
        longitude: nil
      )
    end

    context 'with valid params' do
      subject { post :create, params: { survivor: valid_attributes } }

      include_examples 'shared examples for api/v1 responses', :created, 'survivors/survivor'

      it 'creates a new Survivor', :skip_before_hook do
        expect { subject }.to change(Survivor, :count).by(1)
      end

      it 'response has correct location' do
        expect(response.location).to eq(api_v1_survivor_url(Survivor.last))
      end
    end

    context 'with invalid params' do
      subject { post :create, params: { survivor: invalid_attributes } }

      include_examples 'shared examples for api/v1 responses', :unprocessable_entity, 'error'

      it 'does not create a new Survivor', :skip_before_hook do
        expect { subject }.not_to change(Survivor, :count)
      end
    end
  end

  describe 'PUT #update' do
    let!(:survivor) { create(:survivor, latitude: 56.78, longitude: -56.78) }

    let(:valid_attributes) { { latitude: -12.34, longitude: 12.34 } }
    let(:invalid_attributes) { { latitude: nil, longitude: 'not-valid' } }

    context 'with valid params' do
      subject { put :update, params: { id: survivor, survivor: valid_attributes } }

      include_examples 'shared examples for api/v1 responses', :success, 'survivors/survivor'

      it 'updates the requested survivor' do
        expect(survivor.reload).to have_attributes(valid_attributes)
      end
    end

    context 'with invalid params' do
      subject { put :update, params: { id: survivor, survivor: invalid_attributes } }

      include_examples 'shared examples for api/v1 responses', :unprocessable_entity, 'error'

      it 'does not update the requested survivor' do
        expect(survivor.reload).not_to have_attributes(valid_attributes)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:survivor) { create(:survivor) }
    subject { delete :destroy, params: { id: survivor } }

    it 'response has correct HTTP response' do
      is_expected.to have_http_status(:no_content)
    end

    it 'destroys the requested survivor' do
      expect { survivor.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
