require 'spec_helper'
require 'zssn/throwable'

RSpec.describe Zssn::Throwable do
  context 'when using custom Zssn errors' do
    it 'returns Zssn::Error' do
      expect { raise(Zssn::Error) }.to raise_error(Zssn::Error)
    end

    it 'returns Zssn::InfectedSurvivors' do
      expect { raise(Zssn::InfectedSurvivors) }.to raise_error(Zssn::InfectedSurvivors)
    end

    it 'returns Zssn::DifferentTradePoints' do
      expect { raise(Zssn::DifferentTradePoints) }.to raise_error(Zssn::DifferentTradePoints)
    end
  end
end
