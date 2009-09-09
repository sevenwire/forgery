class Array
  def random
    self[Kernel.rand(size)]
  end

  def random_subset(len=2)
    rs = []
    len.times { rs << random }
    rs
  end
end
