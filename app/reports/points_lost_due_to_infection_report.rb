class PointsLostDueToInfectionReport < BaseReport
  def data
    { points_lost_due_to_infection: Survivor.infected_survivors.sum(&:total_points) }
  end
end
