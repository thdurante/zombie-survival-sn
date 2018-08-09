require 'rails_helper'

RSpec.describe SurvivorSerializer do
  it_behaves_like 'a simple serializer',
    :survivor,
    %i(id name age gender latitude longitude items authored_infection_alerts received_infection_alerts)

  describe 'nested serializers' do
    let(:survivor) do
      create(
        :survivor,
        :with_items,
        :with_authored_infection_alerts,
        :with_received_infection_alerts
      )
    end

    let!(:json) { described_class.new(survivor).as_json }

    let(:expected_nested_items_json) { survivor.items.map { |item| ItemSerializer.new(item).as_json } }

    it 'uses the correct serializer for items' do
      expect(json.fetch(:items)).to eq(expected_nested_items_json)
    end

    %w(authored received).each do |action|
      let(:"expected_nested_#{action}_infection_alerts_json") do
        survivor.send("#{action}_infection_alerts").map { |alert| InfectionAlertSerializer.new(alert).as_json }
      end

      it "uses the correct serializer for #{action}_infection_alerts" do
        expect(
          json.fetch(:"#{action}_infection_alerts")
        ).to eq(send("expected_nested_#{action}_infection_alerts_json"))
      end
    end
  end
end
