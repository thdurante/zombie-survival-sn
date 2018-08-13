class Item < ApplicationRecord
  belongs_to :survivor, inverse_of: :items

  validates :survivor, :kind, presence: true
  validates :kind, inclusion: { in: TradeItem.names }

  TradeItem.names.each do |trade_item|
    scope :"#{trade_item}", -> { where(kind: trade_item) }
    scope :"tradable_#{trade_item}", -> { send(trade_item).joins(:survivor).merge(Survivor.non_infected_survivors) }
    scope :"lost_#{trade_item}", -> { send(trade_item).joins(:survivor).merge(Survivor.infected_survivors) }
  end
end
