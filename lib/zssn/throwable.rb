module Zssn
  class Error < StandardError
    def initialize(message = nil)
      super(message)
    end
  end

  class InfectedSurvivors < Error; end
  class DifferentTradePoints < Error; end
  class InsuficientTradeItems < Error; end

  module Throwable; end
end
