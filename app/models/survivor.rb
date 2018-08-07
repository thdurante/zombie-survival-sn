class Survivor < ApplicationRecord
  validates :name, :age, :gender, :latitude, :longitude, presence: true
  validates :gender, inclusion: { in: Gender.names }
  validates :name, uniqueness: { scope: :gender, case_sensitive: false }
end
