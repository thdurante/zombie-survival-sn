class Item < ApplicationRecord
  belongs_to :survivor, inverse_of: :items

  validates :survivor, :kind, presence: true
  validates :kind, inclusion: { in: TradeItem.names }
end
