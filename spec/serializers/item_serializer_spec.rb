require 'rails_helper'

RSpec.describe ItemSerializer do
  it_behaves_like 'a simple serializer', :item, %i(id kind survivor_id)
end
