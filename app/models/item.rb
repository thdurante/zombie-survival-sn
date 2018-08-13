class Item < ApplicationRecord
  belongs_to :survivor, inverse_of: :items

  validates :survivor, :kind, presence: true
  validates :kind, inclusion: { in: TradeItem.names }

  scope :water, -> { where(kind: TradeItem::WATER.name) }
  scope :food, -> { where(kind: TradeItem::FOOD.name) }
  scope :medication, -> { where(kind: TradeItem::MEDICATION.name) }
  scope :ammunition, -> { where(kind: TradeItem::AMMUNITION.name) }
end
