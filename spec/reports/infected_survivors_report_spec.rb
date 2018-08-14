require 'rails_helper'

RSpec.describe InfectedSurvivorsReport do
  let!(:infected_survivors_list) do
    create_list(:survivor, 3, :with_received_infection_alerts, received_count: 5)
  end

  let!(:non_infected_survivors_list) do
    create_list(:survivor, 3, :with_received_infection_alerts, received_count: 2)
  end

  subject { described_class.data }

  describe '.data' do
    it 'returns only the infected survivors' do
      is_expected.to match_array(infected_survivors_list)
    end
  end
end
