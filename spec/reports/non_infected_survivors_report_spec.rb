require 'rails_helper'

RSpec.describe NonInfectedSurvivorsReport do
  let!(:infected_survivors_list) do
    create_list(:survivor, 3, :with_received_infection_alerts, received_count: 5)
  end

  let!(:non_infected_survivors_list) do
    create_list(:survivor, 3, :with_received_infection_alerts, received_count: 2)
  end

  subject { described_class.data }

  describe '.data' do
    it 'returns only the non infected survivors' do
      is_expected.to match_array(non_infected_survivors_list)
    end
  end
end
