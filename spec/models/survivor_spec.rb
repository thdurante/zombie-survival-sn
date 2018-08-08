require 'rails_helper'

RSpec.describe Survivor, type: :model do
  subject { create(:survivor) }

  describe 'associations' do
    it { is_expected.to have_many(:items).inverse_of(:survivor).dependent(:destroy) }
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
end
