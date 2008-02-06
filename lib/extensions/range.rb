class Range
  def at_rand
    Kernel.rand(self.last - self.first + 1) + self.first
  end
end
