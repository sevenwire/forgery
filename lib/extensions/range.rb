class Range
  def random
    return nil unless self.max
    Integer(min) && Integer(max)
    Kernel.rand(self.max - self.min + 1) + self.min
  rescue ArgumentError
    self.to_a.random
  end
end
