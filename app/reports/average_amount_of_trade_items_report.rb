class AverageAmountOfTradeItemsReport < BaseReport
  def data
    {
      average_water_per_survivor:       average_water_per_survivor,
      average_food_per_survivor:        average_food_per_survivor,
      average_medication_per_survivor:  average_medication_per_survivor,
      average_ammunition_per_survivor:  average_ammunition_per_survivor
    }
  end

  private

  def survivors_count
    @survivors_count ||= Survivor.count.to_f
  end

  def average_water_per_survivor
    (Item.tradable_water.length / survivors_count).round(2)
  end

  def average_food_per_survivor
    (Item.tradable_food.length / survivors_count).round(2)
  end

  def average_medication_per_survivor
    (Item.tradable_medication.length / survivors_count).round(2)
  end

  def average_ammunition_per_survivor
    (Item.tradable_ammunition.length / survivors_count).round(2)
  end
end
