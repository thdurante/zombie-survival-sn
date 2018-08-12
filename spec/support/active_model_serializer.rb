ActiveModelSerializers.config.schema_path = 'spec/support/api/schemas'

RSpec.configure do |config|
  config.include ActiveModelSerializers::Test::Serializer
  config.include ActiveModelSerializers::Test::Schema
end
