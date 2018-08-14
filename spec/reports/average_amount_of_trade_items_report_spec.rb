require 'rails_helper'

RSpec.describe AverageAmountOfTradeItemsReport do
  let!(:not_infected_survivors_list) { create_list(:survivor, 3) }

  let!(:infected_survivor_with_items) do
    create(
      :survivor,
      :with_received_infection_alerts,
      :with_items,
      received_count: 5
    )
  end

  let!(:survivor_with_water_items) do
    create(
      :survivor,
      :with_items,
      items: build_list(:item, 5, kind: TradeItem::WATER.name, survivor: nil)
    )
  end

  let!(:survivor_with_food_items) do
    create(
      :survivor,
      :with_items,
      items: build_list(:item, 2, kind: TradeItem::FOOD.name, survivor: nil)
    )
  end

  let!(:survivor_with_medication_items) do
    create(
      :survivor,
      :with_items,
      items: build_list(:item, 9, kind: TradeItem::MEDICATION.name, survivor: nil)
    )
  end

  let!(:survivor_with_ammunition_items) do
    create(
      :survivor,
      :with_items,
      items: build_list(:item, 2, kind: TradeItem::AMMUNITION.name, survivor: nil)
    )
  end

  let(:expected_response) do
    {
      average_water_per_survivor: 0.38,
      average_food_per_survivor: 0.15,
      average_medication_per_survivor: 0.69,
      average_ammunition_per_survivor: 0.15
    }
  end

  subject { described_class.data }

  describe '.data' do
    it 'returns a hash with expected response' do
      is_expected.to eq(expected_response)
    end
  end
end
