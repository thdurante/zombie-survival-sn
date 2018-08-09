RSpec.shared_examples 'a simple serializer' do |factory_name, json_keys|
  let(:model) { create(factory_name) }
  let(:serializer) { described_class.new(model) }

  it 'returns json with all keys' do
    expect(serializer.as_json.keys).to eq(json_keys)
  end
end
