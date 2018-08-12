class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :gender, :latitude, :longitude

  has_many :items
  has_many :authored_infection_alerts, serializer: InfectionAlertSerializer
  has_many :received_infection_alerts, serializer: InfectionAlertSerializer

  def gender
    Gender.coerce(object.gender).try(:label)
  end
end
