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
end
