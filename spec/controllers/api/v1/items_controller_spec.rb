require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe 'POST #trade' do
    let(:received_infection_alerts_count) { nil }

    let!(:survivor_1) do
      create(
        :survivor,
        :with_items,
        :with_received_infection_alerts,
        items: [build(:item, kind: TradeItem::WATER.name)],
        received_count: received_infection_alerts_count || 1
      )
    end

    let!(:survivor_2) do
      create(
        :survivor,
        :with_items,
        items: build_list(:item, 5, kind: TradeItem::AMMUNITION.name)
      )
    end

    subject { post :trade, params: { trade: params } }

    before do |example|
      subject unless example.metadata[:skip_before_hook]
    end

    context 'with invalid params' do
      context 'with blank hash param' do
        let(:params) { { survivor_1: { id: nil }, survivor_2: { id: nil } } }

        include_examples 'shared examples for api/v1 responses', :unprocessable_entity, 'error'
      end

      context 'with at least one infected survivor' do
        let(:received_infection_alerts_count) { 5 }

        let(:params) do
          {
            survivor_1: { id: survivor_1.id, water: 1 },
            survivor_2: { id: survivor_2.id, ammunition: 4 }
          }
        end

        include_examples 'shared examples for api/v1 responses', :forbidden, 'error'
      end

      context 'with different total trade points' do
        let(:params) do
          {
            survivor_1: { id: survivor_1.id, water: 1 },
            survivor_2: { id: survivor_2.id, ammunition: 1 }
          }
        end

        include_examples 'shared examples for api/v1 responses', :forbidden, 'error'
      end

      context 'with insuficient trade items' do
        let(:params) do
          {
            survivor_1: { id: survivor_1.id, water: 4 },
            survivor_2: { id: survivor_2.id, ammunition: 16 }
          }
        end

        include_examples 'shared examples for api/v1 responses', :forbidden, 'error'
      end
    end

    context 'with valid params' do
      let(:params) do
        {
          survivor_1: { id: survivor_1.id, water: 1 },
          survivor_2: { id: survivor_2.id, ammunition: 4 }
        }
      end

      include_examples 'shared examples for api/v1 responses', :ok, 'items/index'
    end
  end
end
