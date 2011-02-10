class Range
  def random
    Integer(first) && Integer(last)
    raise ArgumentError if first > last
    Kernel.rand(last - first + (exclude_end? ? 0 : 1)) + first
  rescue ArgumentError
    to_a.random
  end
end
