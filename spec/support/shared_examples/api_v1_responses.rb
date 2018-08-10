RSpec.shared_examples 'shared examples for api/v1 responses' do |http_status = :success, json_schema|
  if http_status == :success
    it 'response has correct HTTP response' do
      is_expected.to be_successful
    end
  else
    it 'response has correct HTTP response' do
      is_expected.to have_http_status(http_status)
    end
  end

  it 'response has correct content_type' do
    expect(response.content_type).to eq('application/json')
  end

  it 'matches the correct schema' do
    expect(response).to match_response_schema(json_schema)
  end
end
