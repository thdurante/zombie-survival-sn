class InfectionAlertSerializer < ActiveModel::Serializer
  attributes :id, :author_id, :infected_survivor_id
end
