require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { create(:item) }

  describe 'associations' do
    it { is_expected.to belong_to(:survivor) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:survivor) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_inclusion_of(:kind).in_array(TradeItem.names.map(&:to_s)) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to(0).only_integer }
    it { is_expected.to validate_uniqueness_of(:survivor).scoped_to(:kind) }
  end
end
