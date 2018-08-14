class InfectedSurvivorsReport < BaseReport
  def data
    Survivor.infected_survivors
  end
end
