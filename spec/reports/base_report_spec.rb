require 'rails_helper'

RSpec.describe BaseReport do
  subject { test_klass.data }

  context 'with #data method properly implemented' do
    let(:test_klass) do
      Class.new(BaseReport) do
        def data; end
      end
    end

    it 'does not raise error' do
      expect { subject }.not_to raise_error(NotImplementedError)
    end
  end

  context 'without #data method implementation' do
    let(:test_klass) { Class.new(described_class) }

    it 'raises NotImplementedError' do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
