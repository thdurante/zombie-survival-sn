class InfectionAlert < ApplicationRecord
  belongs_to :infected_survivor, class_name: 'Survivor'
  belongs_to :author, class_name: 'Survivor'

  validates :infected_survivor, :author, presence: true
  validates :infected_survivor_id, uniqueness: { scope: :author_id }
end
