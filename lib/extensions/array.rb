class Array
  def random
    self[Kernel.rand(size)]
  end
end