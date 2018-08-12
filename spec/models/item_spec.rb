require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { create(:item) }

  describe 'associations' do
    it { is_expected.to belong_to(:survivor).inverse_of(:items) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:survivor) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_inclusion_of(:kind).in_array(TradeItem.names.map(&:to_s)) }
  end

  describe 'scopes' do
    TradeItem.names.each do |trade_item|
      describe ".#{trade_item}" do
        (TradeItem.names - Array(trade_item)).each do |different_trade_item|
          let!(:"#{different_trade_item}_list") { create_list(:item, 3, kind: different_trade_item) }
        end

        let!(:"#{trade_item}_list") { create_list(:item, 3, kind: trade_item) }

        subject { described_class.send(trade_item) }

        it "returns the items with #{trade_item} kind" do
          is_expected.to match_array(send("#{trade_item}_list"))
        end
      end
    end
  end
end
