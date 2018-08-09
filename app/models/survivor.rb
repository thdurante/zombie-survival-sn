class Survivor < ApplicationRecord
  has_many :items, inverse_of: :survivor, dependent: :destroy

  has_many :authored_infection_alerts,
    class_name: 'InfectionAlert',
    foreign_key: :author_id,
    inverse_of: :author,
    dependent: :destroy

  has_many :received_infection_alerts,
    class_name: 'InfectionAlert',
    foreign_key: :infected_survivor_id,
    inverse_of: :infected_survivor,
    dependent: :destroy

  validates :name, :age, :gender, :latitude, :longitude, presence: true
  validates :gender, inclusion: { in: Gender.names }
  validates :name, uniqueness: { scope: :gender, case_sensitive: false }

  accepts_nested_attributes_for :items
end
