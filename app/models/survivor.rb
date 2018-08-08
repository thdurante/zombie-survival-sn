class Survivor < ApplicationRecord
  has_many :items, inverse_of: :survivor, dependent: :destroy

  validates :name, :age, :gender, :latitude, :longitude, presence: true
  validates :gender, inclusion: { in: Gender.names }
  validates :name, uniqueness: { scope: :gender, case_sensitive: false }

  accepts_nested_attributes_for :items
end
