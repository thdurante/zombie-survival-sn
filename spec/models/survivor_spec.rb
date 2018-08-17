require 'rails_helper'

RSpec.describe Survivor, type: :model do
  subject { create(:survivor) }

  describe 'associations' do
    it { is_expected.to have_many(:items).inverse_of(:survivor).dependent(:destroy) }

    it do
      is_expected.to have_many(:authored_infection_alerts)
        .class_name('InfectionAlert')
        .with_foreign_key(:author_id)
        .inverse_of(:author)
        .dependent(:destroy)
    end

    it do
      is_expected.to have_many(:received_infection_alerts)
        .class_name('InfectionAlert')
        .with_foreign_key(:infected_survivor_id)
        .inverse_of(:infected_survivor)
        .dependent(:destroy)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_inclusion_of(:gender).in_array(Gender.names.map(&:to_s)) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:gender).case_insensitive }
    it { is_expected.to accept_nested_attributes_for(:items) }
  end

  describe 'scopes' do
    let!(:infected_survivors_list) do
      create_list(:survivor, 3, :with_received_infection_alerts, received_count: 5)
    end

    let!(:non_infected_survivors_list) do
      create_list(:survivor, 3, :with_received_infection_alerts, received_count: 2)
    end

    describe '.infected_survivors' do
      subject { described_class.infected_survivors }

      it 'returns only the infected survivors' do
        is_expected.to match_array(infected_survivors_list)
      end
    end

    describe '.non_infected_survivors' do
      subject { described_class.non_infected_survivors }

      it 'returns only the non infected survivors' do
        is_expected.to match_array(
          non_infected_survivors_list +
            infected_survivors_list.map(&:received_infection_alerts).flatten.map(&:author) +
            non_infected_survivors_list.map(&:received_infection_alerts).flatten.map(&:author)
        )
      end
    end
  end

  describe 'instance methods' do
    describe '#infected?' do
      let!(:infected_survivor) { create(:survivor, :with_received_infection_alerts, received_count: 4) }
      let!(:uninfected_survivor) { create(:survivor, :with_received_infection_alerts, received_count: 2) }

      it 'returns true for infected survivor' do
        expect(infected_survivor).to be_infected
      end

      it 'returns false for uninfected survivor' do
        expect(uninfected_survivor).not_to be_infected
      end
    end

    describe '#total_points' do
      let(:water_list) { build_list(:item, 2, kind: TradeItem::WATER.name) } # 8 points
      let(:food_list) { build_list(:item, 1, kind: TradeItem::FOOD.name) } # 3 points
      let(:medication_list) { build_list(:item, 3, kind: TradeItem::MEDICATION.name) } # 6 points
      let(:ammunition_list) { build_list(:item, 5, kind: TradeItem::AMMUNITION.name) } # 5 points

      let!(:survivor) do
        create(
          :survivor,
          :with_items,
          items: water_list + food_list + medication_list + ammunition_list
        )
      end

      it 'returns the sum each item cost' do
        expect(survivor.total_points).to eq(22)
      end
    end
  end
end
