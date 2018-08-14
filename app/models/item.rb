class Item < ApplicationRecord
  belongs_to :survivor, inverse_of: :items

  validates :survivor, :kind, presence: true
  validates :kind, inclusion: { in: TradeItem.names }

  TradeItem.names.each do |trade_item|
    scope :"#{trade_item}", -> { where(kind: trade_item) }

    scope :"tradable_#{trade_item}", -> do
      send(trade_item)
        .joins(:survivor)
        .where
        .not(survivors: { id: Survivor.infected_survivors.pluck(:id) })
    end

    scope :"lost_#{trade_item}", -> do
      send(trade_item)
        .joins(:survivor)
        .where(survivors: { id: Survivor.infected_survivors.pluck(:id) })
    end
  end
end
