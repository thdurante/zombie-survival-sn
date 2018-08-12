require 'rails_helper'

RSpec.describe Api::V1::InfectionAlertsController, type: :controller do
  before do |example|
    subject unless example.metadata[:skip_before_hook]
  end

  describe 'POST #create' do
    let(:author) { create(:survivor) }
    let(:infected_survivor) { create(:survivor) }

    let(:valid_attributes) do
      { author_id: author.id, infected_survivor_id: infected_survivor.id }
    end

    let(:invalid_attributes) do
      { author_id: nil, infected_survivor_id: 123_456 }
    end

    context 'with valid params' do
      subject { post :create, params: { infection_alert: valid_attributes } }

      include_examples 'shared examples for api/v1 responses', :created, 'infection_alert'

      it 'creates a new InfectionAlert', :skip_before_hook do
        expect { subject }.to change(InfectionAlert, :count).by(1)
      end

      it 'response has correct location' do
        expect(response.location).to eq(api_v1_survivor_url(infected_survivor))
      end

      it 'sets the \'authored_infection_alerts\' relation on author survivor' do
        expect(author.reload.authored_infection_alerts).to match_array(InfectionAlert.where(author: author))
      end

      it 'sets the \'received_infection_alerts\' relation on infected survivor' do
        expect(
          infected_survivor.reload.received_infection_alerts
        ).to match_array(InfectionAlert.where(infected_survivor: infected_survivor))
      end
    end

    context 'with invalid params' do
      subject { post :create, params: { infection_alert: invalid_attributes } }

      include_examples 'shared examples for api/v1 responses', :unprocessable_entity, 'error'

      it 'does not create a new InfectionAlert', :skip_before_hook do
        expect { subject }.not_to change(InfectionAlert, :count)
      end

      it 'response has the correct error message' do
        expect(response.body).to eq(
          { errors: [I18n.t('infection_alerts.wrong_id_param', param: :author_id)] }.to_json
        )
      end
    end
  end
end
