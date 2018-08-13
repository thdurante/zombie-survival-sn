class BaseReport
  private_class_method :new

  def self.data
    new.data
  end

  def initialize; end

  def data
    raise NotImplementedError
  end
end
