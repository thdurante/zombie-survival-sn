class Item < ApplicationRecord
  belongs_to :survivor

  validates :survivor, :kind, :amount, presence: true
  validates :kind, inclusion: { in: TradeItem.names }
  validates :amount, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :survivor, uniqueness: { scope: :kind }
end
