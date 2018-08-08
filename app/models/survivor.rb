class Survivor < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, :age, :gender, :latitude, :longitude, presence: true
  validates :gender, inclusion: { in: Gender.names }
  validates :name, uniqueness: { scope: :gender, case_sensitive: false }
end
