require 'rails_helper'

RSpec.describe InfectionAlertSerializer do
  it_behaves_like 'a simple serializer', :infection_alert, %i(id author_id infected_survivor_id)
end
