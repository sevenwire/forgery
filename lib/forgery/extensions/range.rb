class Range
  def random
    Integer(first) && Integer(last)
    raise ArgumentError if first > last
    Kernel.rand(last - first + 1) + first
  rescue ArgumentError
    to_a.random
  end
end
