require 'rails_helper'

RSpec.describe InfectionAlert, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('Survivor') }
    it { is_expected.to belong_to(:infected_survivor).class_name('Survivor') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:infected_survivor) }
  end
end
