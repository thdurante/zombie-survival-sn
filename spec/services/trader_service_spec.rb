require 'rails_helper'

RSpec.describe TraderService do
  describe '.call' do
    before do |example|
      subject unless example.metadata[:skip_before_hook]
    end

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

    subject { described_class.call(params) }

    context 'with invalid params' do
      let(:params) { {} }

      it 'raises an ActiveRecord::RecordNotFound error', :skip_before_hook do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'with at least one infected user' do
      let(:received_infection_alerts_count) { 5 }

      let(:params) do
        {
          survivor_1: { id: survivor_1.id, water: 1 },
          survivor_2: { id: survivor_2.id, ammunition: 4 }
        }
      end

      it 'raises an Zssn::InfectedSurvivors error', :skip_before_hook do
        expect { subject }.to raise_error(Zssn::InfectedSurvivors)
      end

      it 'the raised error has the correct message', :skip_before_hook do
        begin
          subject
        rescue Zssn::InfectedSurvivors => error
          expect(error.message).to eq(I18n.t('items.infected_survivors'))
        end
      end
    end

    context 'with different total trade points' do
      let(:params) do
        {
          survivor_1: { id: survivor_1.id, water: 1 },
          survivor_2: { id: survivor_2.id, ammunition: 1 }
        }
      end

      it 'raises an Zssn::DifferentTradePoints error', :skip_before_hook do
        expect { subject }.to raise_error(Zssn::DifferentTradePoints)
      end

      it 'the raised error has the correct message', :skip_before_hook do
        begin
          subject
        rescue Zssn::DifferentTradePoints => error
          expect(error.message).to eq(I18n.t('items.different_trade_points'))
        end
      end
    end

    context 'with insuficient trade items' do
      let(:params) do
        {
          survivor_1: { id: survivor_1.id, water: 4 },
          survivor_2: { id: survivor_2.id, ammunition: 16 }
        }
      end

      it 'raises an Zssn::InsuficientTradeItems error', :skip_before_hook do
        expect { subject }.to raise_error(Zssn::InsuficientTradeItems)
      end

      it 'the raised error has the correct message', :skip_before_hook do
        begin
          subject
        rescue Zssn::InsuficientTradeItems => error
          expect(error.message).to eq(I18n.t('items.insuficient_trade_items'))
        end
      end
    end

    context 'valid trade' do
      let(:params) do
        {
          survivor_1: { id: survivor_1.id, water: 1 },
          survivor_2: { id: survivor_2.id, ammunition: 4 }
        }
      end

      it 'trades the items for survivor 1' do
        expect(survivor_1.reload.items.ammunition.count).to eq(4)
      end

      it 'trades the items for survivor 2' do
        expect(survivor_2.reload.items.water.count).to eq(1)
      end
    end
  end
end
