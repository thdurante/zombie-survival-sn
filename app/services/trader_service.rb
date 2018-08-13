class TraderService
  include Zssn::Throwable

  private_class_method :new

  def self.call(params)
    new(params).trade!
  end

  def initialize(params)
    initialize_survivors_info(params)
    load_trade_amounts
  end

  def trade!
    raise(Zssn::InfectedSurvivors, I18n.t('items.infected_survivors')) && return if infected_survivors?
    raise(Zssn::DifferentTradePoints, I18n.t('items.different_trade_points')) && return if different_trade_points?
    raise(Zssn::InsuficientTradeItems, I18n.t('items.insuficient_trade_items')) && return if insuficient_trade_items?

    perform_trade!
  end

  private

  def initialize_survivors_info(params)
    (1..2).each do |survivor|
      instance_variable_set(
        "@survivor_#{survivor}_params",
        params.fetch(:"survivor_#{survivor}", {}).with_indifferent_access
      )

      instance_variable_set(
        "@survivor_#{survivor}",
        Survivor.find(instance_variable_get("@survivor_#{survivor}_params").fetch(:id, nil))
      )

      instance_variable_set("@survivor_#{survivor}_total_trade_points", 0)
    end
  end

  def load_trade_amounts
    TradeItem.names.each do |trade_item|
      (1..2).each do |survivor|
        instance_variable_set(
          "@survivor_#{survivor}_#{trade_item}_amount",
          instance_variable_get("@survivor_#{survivor}_params").fetch(trade_item, 0)
        )

        increment_total_trade_points!(survivor, trade_item)
      end
    end
  end

  def increment_total_trade_points!(survivor, trade_item)
    trade_item_amount = instance_variable_get("@survivor_#{survivor}_#{trade_item}_amount")
    trade_item_cost = TradeItem.coerce(trade_item).cost
    total_trade_points = instance_variable_get("@survivor_#{survivor}_total_trade_points")

    instance_variable_set(
      "@survivor_#{survivor}_total_trade_points",
      total_trade_points + (trade_item_amount * trade_item_cost)
    )
  end

  def infected_survivors?
    @survivor_1.infected? || @survivor_2.infected?
  end

  def different_trade_points?
    @survivor_1_total_trade_points != @survivor_2_total_trade_points
  end

  def insuficient_trade_items?
    TradeItem.names.each do |trade_item|
      (1..2).each do |survivor|
        return true if instance_variable_get("@survivor_#{survivor}").items.send(trade_item).count \
                          < instance_variable_get("@survivor_#{survivor}_#{trade_item}_amount")
      end
    end
    false
  end

  def other_survivor_id(survivor)
    ([@survivor_1.id, @survivor_2.id] - Array(instance_variable_get("@survivor_#{survivor}").id)).first
  end

  def perform_trade!
    TradeItem.names.each do |trade_item|
      (1..2).each do |survivor|
        trade_amount = instance_variable_get("@survivor_#{survivor}_#{trade_item}_amount")
        next if trade_amount.zero?

        instance_variable_get("@survivor_#{survivor}")
          .items
          .send(trade_item)
          .limit(trade_amount)
          .update_all(survivor_id: other_survivor_id(survivor))
      end
    end
  end
end
