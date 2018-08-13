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

  scope :infected_survivors, -> do
    joins(:received_infection_alerts)
      .group(:id, :infected_survivor_id)
      .having('count(infected_survivor_id) >= 3')
  end

  scope :non_infected_survivors, -> do
    joins(:received_infection_alerts)
      .group(:id, :infected_survivor_id)
      .having('count(infected_survivor_id) < 3')
  end

  def infected?
    received_infection_alerts.size >= 3
  end

  def total_points
    items.sum { |item| TradeItem.coerce(item.kind).cost }
  end
end
