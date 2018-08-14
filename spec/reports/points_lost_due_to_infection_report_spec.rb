require 'rails_helper'

RSpec.describe PointsLostDueToInfectionReport do
  let!(:not_infected_survivors_list) { create_list(:survivor, 3, :with_items) }

  let!(:infected_survivor_with_items) do
    create(
      :survivor,
      :with_received_infection_alerts,
      :with_items,
      received_count: 5,
      items: (
        build_list(:item, 3, kind: TradeItem::WATER.name, survivor: nil) +
        build_list(:item, 2, kind: TradeItem::FOOD.name, survivor: nil) +
        build_list(:item, 5, kind: TradeItem::MEDICATION.name, survivor: nil) +
        build_list(:item, 20, kind: TradeItem::AMMUNITION.name, survivor: nil)
      )
    )
  end

  let!(:other_infected_survivor_with_items) do
    create(
      :survivor,
      :with_received_infection_alerts,
      :with_items,
      received_count: 8,
      items: build_list(:item, 13, kind: TradeItem::AMMUNITION.name, survivor: nil)
    )
  end

  let(:expected_response) do
    {
      points_lost_due_to_infection: (
        (3 * TradeItem::WATER.cost) + (2 * TradeItem::FOOD.cost) +
          (5 * TradeItem::MEDICATION.cost) + ((20 + 13) * TradeItem::AMMUNITION.cost)
      )
    }
  end

  subject { described_class.data }

  describe '.data' do
    it 'returns a hash with expected response' do
      is_expected.to eq(expected_response)
    end
  end
end
