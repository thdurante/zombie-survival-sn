class Item < ApplicationRecord
  belongs_to :survivor

  validates :survivor, :kind, presence: true
  validates :kind, inclusion: { in: TradeItem.names }
end
