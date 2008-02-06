class String
  def numerify
    self.gsub(/#/) { Kernel.rand(10).to_s }
  end
end