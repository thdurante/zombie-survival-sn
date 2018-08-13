class NonInfectedSurvivorsReport < BaseReport
  def data
    Survivor.non_infected_survivors
  end
end
